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
    tbueno = {
      url = "path:./flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, tbueno }:
  let
    configuration = { pkgs, ... }: {
      # not needed. The confs are in separate files
    };
    hostName = "MN-G2P25G9M2N";
    # This is because home and username (whoami) can be different
    userName = "bueno";
    email = "thiago.buenosilva@mightynetworks.com";
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
      system = "aarch64-darwin";

      modules = [
        ({ config, pkgs, lib, ... }: {
          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;
          system.checks.verifyNixPath = false;
          system.primaryUser = userName;
        })

        tbueno.system

        home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
          
            home-manager.users.${userName} = {
              home.stateVersion = "24.11";
              home.homeDirectory = nixpkgs.lib.mkForce "/Users/${userName}";
              imports = [
                tbueno.home
              ];
            };
            home-manager.extraSpecialArgs = specialArgs;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations.${hostName}.pkgs;
  };
}
