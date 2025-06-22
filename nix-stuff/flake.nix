{
  description = "a lil flake for funsies";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    ags.url = "github:Aylur/ags";
    ags.inputs.nixpkgs.follows = "nixpkgs";
                #astal.url = "github:Aylur/astal";
                #astal.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ags, astal, nvf, ... }: 
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
#    
#    packages.${system}. default = pkgs.stdenvNoCC.mkDerivation rec {
#      name = "my-shell";
#      src = ./.;
#
#      nativeBuildInputs = [
#        ags.packages.${system}.default
#        pkgs.wrapGAppsHook
#        pkgs.gobject-introspection
#      ];
#
#      buildInputs = with astal.packages.${system}; [
#        astal3
#        io
#        hyprland 
#        battery 
#        bluetooth 
#        network 
#        mpris 
#        wireplumber
#        tray 
#        # any other package
#      ];
#
#      installPhase = ''
#        mkdir -p $out/bin
#        ags bundle app.ts $out/bin/${name}
#      '';
#    };
 
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./modules/configuration.nix
        # ./modules/blesh-configuration.nix
        {
          _module.args = {
        #ags = ags.packages.${system}.default;
        #astal = astal.packages.${system}.default;
        #astalBattery = astal.packages.${system}.battery;
        #astalBluetooth = astal.packages.${system}.bluetooth;
        #astalNetwork = astal.packages.${system}.network;
        #astalMpris = astal.packages.${system}.mpris;
        #astalHyprland = astal.packages.${system}.hyprland;
        #astalWp = astal.packages.${system}.wireplumber;
        #astalTray = astal.packages.${system}.tray;
            nvfNeovim = nvfNeovim;
          };
        }
      ];
    }; 

};


}
