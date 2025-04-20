{
  description = "Thiago Bueno's Nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # not needed. The confs are in separate files
    };
    hostName = "mini";
    # This is because home and username (whoami) can be different
    userName = "bueno";
    email = "tbueno@gmail.com";
    home = "bueno";
    specialArgs =
      inputs
      // {
        inherit userName hostName home email;
      };
  in
  {
    darwinConfigurations.${hostName} = nix-darwin.lib.darwinSystem {
      inherit specialArgs;
      system = {
      	# Set Git commit hash for darwin-version.
      	configurationRevision = self.rev or self.dirtyRev or null;
        checks.verifyNixPath = false;
      };

      modules = [
      	./configuration.nix

        home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${userName} = import ./home.nix;
            home-manager.extraSpecialArgs = specialArgs;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations.${hostName}.pkgs;
  };
}
