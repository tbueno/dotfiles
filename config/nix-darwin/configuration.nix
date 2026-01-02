{ config, pkgs, home, userName,  ... }:

{
  nix.settings.experimental-features = "nix-command flakes";
  nix.enable = false;

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
      docker
      git
      go
      home-manager
      hugo
      jetbrains-mono
      neovim
      uv
      ruby
      wezterm
      zsh-syntax-highlighting
      zsh-autosuggestions
    ];
  };

  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
