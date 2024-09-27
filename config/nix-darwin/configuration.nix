{ config, pkgs, home, userName,  ... }:

{
  environment.variables = {
    EDITOR = "nvim";
  };
  environment.systemPackages = with pkgs; [
    asdf-vm
    git
    home-manager
  ];

  system.defaults = {
    dock.autohide = true;
    finder.AppleShowAllExtensions = true;
    screencapture.location = "~/Downloads/screenshots";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  users.users.${userName} = {
    home = "/Users/${home}";
  };


  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  homebrew = {
    enable = true;

    brews = [
      "pyenv-virtualenv"
    ];

    casks = [
      "1password"
      "arc"
      "dropbox"
      "firefox"
      "google-chrome"
      "iterm2"
      "obsidian"
      "slacK"
    ];
  };

  # Enable sudo to be unlocked with touch ID
  security.pam.enableSudoTouchIdAuth = true;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
