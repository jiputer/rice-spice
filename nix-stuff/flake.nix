{
  description = "a lil flake for funsies";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
  
};

  outputs = { self, nixpkgs, home-manager, nvf, ... }: 
   let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nvfNeovim = (nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [ ./modules/nvf-configuration.nix ];
      }).neovim;
   in
  {
    
    packages.${system}.default = nvfNeovim;
 
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./modules/configuration.nix
        {
	_module.args = {
		nvfNeovim = nvfNeovim;
	};
	
	} 
        home-manager.nixosModules.home-manager
        {
           home-manager.useUserPackages = true;
           home-manager.useGlobalPkgs = true;
           home-manager.users.jiputer = import ./modules/home.nix; 
           home-manager.backupFileExtension = "backup";    
        }

	
      ];
    }; 

};


}
