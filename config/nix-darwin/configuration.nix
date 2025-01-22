{ config, pkgs, home, userName,  ... }:

{
  nix.settings.experimental-features = "nix-command flakes";

  imports = [
    ./system/homebrew.nix
    ./system/macos.nix
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  users.users.${userName} = {
    home = "/Users/${home}";
    packages = with pkgs; [
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

  system.stateVersion = 4;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
