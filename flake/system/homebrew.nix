{ config, pkgs, ... }:

{
  programs.zsh = {
    shellInit = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };

  homebrew = {
      enable = true;
      onActivation = {
        autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
        upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
        # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
        cleanup = "zap";
      };

      brews = [
        "pure"
      ];

      casks = [
        "1password"
        "chatgpt"
        "google-chrome"
        "cursor"
        "dropbox"
        "firefox"
        "obsidian"
        "openvpn-connect"
        "raycast"
        "slack"
        "visual-studio-code"
        "wezterm"
      ];
    };
}