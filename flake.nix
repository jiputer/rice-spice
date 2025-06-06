{
  description = "a lil flake for funsies";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    ags.url = "github:Aylur/ags";
    ags.inputs.nixpkgs.follows = "nixpkgs";
    astal.url = "github:Aylur/astal";
    astal.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, astal, ags, ... }: 
   let
      system = "x86_64-linux";
   in

  {
   nixosConfigurations.ricespice = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        ./modules/system.nix
        ./modules/user.nix
        ./modules/networking.nix
        ./modules/programs.nix
        ./modules/services.nix
        ./modules/gui.nix

        # maybe ill use home-manager, we'll see..
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jiputer = import ./modules/home-manager.nix;
        }
	{
        environment.systemPackages = [
          astal.packages.${system}.default
	  ags.packages.${system}.default
        ];
        }
      ];
    };
  };
}

