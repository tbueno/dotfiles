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
    {
      # ✅ System-level module (nix-darwin) - accepts parameters as function
      darwinModules.default = { userName, hostName, home, email, ... }@args: {
        # Use the passed parameters instead of hardcoded values
        networking.hostName = hostName;

        users.users.${userName} = {
          name = userName;
          home = home;  # Use the full path passed by camp
        };

        # Your existing configuration from ./configuration.nix
        # Import it here or keep it as a separate module
        imports = [ ./system.nix ];

        # Pass args to your configuration if needed
        _module.args = args;
      };

      # ✅ User-level module (home-manager) - accepts parameters as function
      homeManagerModules.default = { userName, home, email, ... }@args: {
        home.username = userName;
        home.homeDirectory = home;

        # Your existing home configuration from ./home.nix
        imports = [ ./home.nix ];

        # Pass args to your home config if needed
        _module.args = args;
      };

      # Optional: Keep the old darwinConfigurations for standalone use
      # (when NOT using camp)
      darwinConfigurations.macbook = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {
          inherit (inputs) nixpkgs home-manager;
          userName = "bueno";
          hostName = "macbook";
          home = "/Users/bueno";
          email = "tbueno@gmail.com";
        };
        modules = [
          ./system.nix
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bueno = { imports = [ ./home.nix ]; };
          }
        ];
      };
    };
  }
