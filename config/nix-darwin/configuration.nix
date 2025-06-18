{ config, pkgs, home, userName,  ... }:

{
  nix.settings.experimental-features = "nix-command flakes";

  imports = [
    ./system/homebrew.nix
    ./system/macos.nix
  ];

  users.users.${userName} = {
    home = "/Users/${home}";
    packages = with pkgs; [
      bat
      clojure
      colima
      devbox
      direnv
      docker
      git
      home-manager
      jetbrains-mono
      neovim
      pyenv
      uv
      wezterm
      zsh-syntax-highlighting
      zsh-autosuggestions
    ];
  };

  programs.direnv.enable = true;
  programs.zsh.enable = true;

  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
