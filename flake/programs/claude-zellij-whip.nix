{ config, lib, pkgs, ... }:

let
  src = pkgs.fetchFromGitHub {
    owner = "rvcas";
    repo = "claude-zellij-whip";
    rev = "82807a2f52d395df5715eee60ecd449a24160263";
    hash = "sha256-BhuvlbgBvHkeXvhc1ByBvzLaM18VmJ37LnSyWECeFPg=";
  };

  homeDir = config.home.homeDirectory;
  app = "${homeDir}/Applications/ClaudeZellijWhip.app";
  cacheDir = "${config.xdg.cacheHome}/claude-zellij-whip";
  stamp = "${config.xdg.stateHome}/claude-zellij-whip/src";

  # Swift comes from the Xcode Command Line Tools, so the app is built outside
  # the Nix sandbox and installed into ~/Applications by the upstream Makefile.
  build = pkgs.writeShellScript "claude-zellij-whip-build" ''
    set -euo pipefail
    rm -rf "${cacheDir}/src"
    cp -R ${src} "${cacheDir}/src"
    chmod -R u+w "${cacheDir}/src"
    cd "${cacheDir}/src"
    make install
  '';

  buildPath = "${lib.makeBinPath [ pkgs.git pkgs.gnumake ]}:/usr/bin:/bin:/usr/sbin:/sbin";

  claudeSettings = "${homeDir}/.claude/settings.json";

  notifyHook = matcher: message: {
    inherit matcher;
    hooks = [{
      type = "command";
      command = "open ~/Applications/ClaudeZellijWhip.app --args notify --title \"Claude Code\" --message \"${message}\" --folder \"\${CLAUDE_PROJECT_DIR##*/}\"";
    }];
  };

  notificationHooks = [
    (notifyHook "idle_prompt" "Waiting for your input")
    (notifyHook "permission_prompt" "Permission needed")
  ];

  # Replaces the whip entries in .hooks.Notification and keeps everything else.
  mergeHooks = ''
    .hooks.Notification = (
      ((.hooks.Notification // []) | map(select(tojson | contains("ClaudeZellijWhip.app") | not)))
      + $entries
    )
  '';
in
lib.mkIf pkgs.stdenv.isDarwin {
  xdg.configFile."claude-zellij-whip/config.toml".text = ''
    terminal = "wezterm"
  '';

  home.activation.claudeZellijWhip = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -d "${app}" ] && [ "$(cat "${stamp}" 2>/dev/null)" = "${src}" ]; then
      verboseEcho "claude-zellij-whip is up to date"
    elif ! /usr/bin/xcode-select -p >/dev/null 2>&1; then
      warnEcho "claude-zellij-whip: Xcode Command Line Tools are missing, run 'xcode-select --install' and rebuild"
    elif [ -n "''${DRY_RUN:-}" ]; then
      echo "Would build claude-zellij-whip from ${src}"
    else
      echo "Building claude-zellij-whip"
      mkdir -p "${cacheDir}" "$(dirname "${stamp}")"
      if /usr/bin/env -i HOME="${homeDir}" USER="${config.home.username}" PATH="${buildPath}" \
          ${build} >"${cacheDir}/build.log" 2>&1; then
        echo "${src}" > "${stamp}"
      else
        warnEcho "claude-zellij-whip: build failed, see ${cacheDir}/build.log"
      fi
    fi
  '';

  home.activation.claudeZellijWhipHooks = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    settings="${claudeSettings}"
    mkdir -p "$(dirname "$settings")"
    tmp="$(mktemp "$settings.XXXXXX")"
    chmod 600 "$tmp"
    if [ -e "$settings" ]; then current="$settings"; else current=/dev/null; fi
    if ! { cat "$current"; [ -s "$current" ] || echo '{}'; } \
        | ${pkgs.jq}/bin/jq --argjson entries ${lib.escapeShellArg (builtins.toJSON notificationHooks)} \
          ${lib.escapeShellArg mergeHooks} >"$tmp"; then
      warnEcho "claude-zellij-whip: could not update hooks in $settings, is it valid JSON?"
      rm -f "$tmp"
    elif [ -e "$settings" ] && ${pkgs.jq}/bin/jq -e --slurpfile new "$tmp" '. == $new[0]' "$settings" >/dev/null; then
      rm -f "$tmp"
    elif [ -n "''${DRY_RUN:-}" ]; then
      echo "Would update Claude Code notification hooks in $settings"
      rm -f "$tmp"
    else
      echo "Updating Claude Code notification hooks in $settings"
      mv "$tmp" "$settings"
    fi
  '';
}
