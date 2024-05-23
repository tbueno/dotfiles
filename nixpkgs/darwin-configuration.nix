{ config, pkgs, ... }:

{
  environment.variables = {
    EDITOR = "nvim";
  };
  # List packages installed in system profile. To search by name, run:
  environment.systemPackages = with pkgs; [
    alacritty
    asdf-vm
    bat
    clojure
    colima
    docker
    home-manager
    neovim
    pyenv
  ];

  system.defaults = {
    dock.autohide = true;
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  users.users.bueno = {
    name = "bueno";
    home = "/Users/bueno";
  };


  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Enable sudo to be unlocked with touch ID
  security.pam.enableSudoTouchIdAuth = true;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
