{
  description = "My personal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    home = import ./home.nix;
    system = import ./system.nix;

  };
}
