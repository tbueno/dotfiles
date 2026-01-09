{
  description = "My personal flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    home = { userName, hostName, home, email, ... }: {
      imports = [ ./home.nix ];
    };

    system = { userName, hostName, home, email, ... }: {
      imports = [ ./system.nix ];
    };

  };
}
