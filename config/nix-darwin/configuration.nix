{ config, pkgs, home, userName,  ... }:

{
  environment.variables = {
    EDITOR = "nvim";
  };
  environment.systemPackages = with pkgs; [
    alacritty
    asdf-vm
    bat
    clojure
    colima
    docker
    docker-compose
    git
    home-manager
    neovim
    pyenv
    zsh-syntax-highlighting
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

  # homebrew = {
  #   enable = true;

  #   casks = [
  #     "pyenv-virtualenv"
  #     # "visual-studio-code"
  #   ];
  # };

  # Enable sudo to be unlocked with touch ID
  security.pam.enableSudoTouchIdAuth = true;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
