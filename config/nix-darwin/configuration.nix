{ config, pkgs, home, userName,  ... }:

{
  nix.settings.experimental-features = "nix-command flakes";
  system.defaults = {
    dock.autohide = true;
    finder.AppleShowAllExtensions = true;
    screencapture.location = "~/Downloads/screenshots";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  users.users.${userName} = {
    home = "/Users/${home}";
    packages = with pkgs; [
      alacritty
      bat
      clojure
      colima
      direnv
      docker
      git
      home-manager
      jetbrains-mono
      neovim
      pyenv
      zsh-syntax-highlighting
    ];
  };

  programs.direnv.enable = true;
  programs.zsh.enable = true;

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
      "arc"
      "dropbox"
      "firefox"
      "iterm2"
      "obsidian"

      "visual-studio-code"
    ];
  };

  # Enable sudo to be unlocked with touch ID
  security.pam.enableSudoTouchIdAuth = true;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
