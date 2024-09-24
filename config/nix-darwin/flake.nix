{
  description = "Thiago Bueno's Nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nixpkgs-unstable, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # not needed. The confs are in separate files
    };
    home = "bueno";
    specialArgs =
      inputs
      // {
        inherit userName hostName home;
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

        # home-manager.darwinModules.home-manager {
        #     home-manager.useGlobalPkgs = true;
        #     home-manager.useUserPackages = true;
        #     home-manager.users.mac = import ./home.nix;
        # }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations.${hostName}.pkgs;
  };
}