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

    nvf.url = "github:notashelf/nvf";
    #nvf.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, astal, ags, nvf, ... }: 
   let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
   in
  {
   packages.${system}.nixos = (nvf.lib.neovimConfiguration {
	inherit pkgs;
	modules = [./modules/nvf-configuration.nix];
   }).neovim;

   nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./modules/configuration.nix
	# ./modules/nvf-configuration.nix
        # maybe ill use home-manager, we'll see..
        # home-manager.nixosModules.home-manager
        #{
        #  home-manager.useGlobalPkgs = true;
        #  home-manager.useUserPackages = true;
        #  home-manager.users.jiputer = import ./modules/home-manager.nix;
        #}
	
        nvf.nixosModules.default
	{
        _module.args = {
            ags = ags.packages.${system}.default;
            astal = astal.packages.${system}.default;
          };
        }
	#{
        #environment.systemPackages = [
        #  astal.packages.${system}.default
	# ags.packages.${system}.default
        #];
        #};
      ];
    };
  };
}
