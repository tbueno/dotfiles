{ lib, userName, ... }:

let
  target = "/etc/profiles/per-user/${userName}/bin/zellij";
  link = "/usr/local/bin/zellij";
in
{
  # claude-zellij-whip only looks for zellij in Homebrew and system paths.
  system.activationScripts.postActivation.text = lib.mkAfter ''
    if [ -e "${link}" ] && [ ! -L "${link}" ]; then
      echo "warning: ${link} is not a symlink, leaving it alone" >&2
    else
      mkdir -p "$(dirname "${link}")"
      ln -sfn "${target}" "${link}"
    fi
  '';
}
