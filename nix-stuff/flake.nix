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
    nvf.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, astal, ags, nvf, ... }: 
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
        ./modules/system.nix

        {
          _module.args = {
            ags = ags.packages.${system}.default;
            astal = astal.packages.${system}.default;
            nvfNeovim = nvfNeovim;
          };
        }
      ];
    };
  };
}
