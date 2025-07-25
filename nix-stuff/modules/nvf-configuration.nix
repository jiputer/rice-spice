{ pkgs, lib, ... }:

{
  # This file is used by nvf modules (not your own config directly)
  vim = {
	theme = { 
		enable = true;
		name = "gruvbox";
		style = "dark";
		};
   
       statusline.lualine.enable = true;
       telescope.enable = true;
       autocomplete.nvim-cmp.enable = true;
       options = {
          number = true;
          cursorline = true;
          relativenumber = false; # or true if you want relative numbers
       };
       languages = {
	 enableLSP = true;
	 enableTreesitter = true;

	 nix.enable = true;
	 ts.enable = true;
	 rust.enable = true;
         python.enable = true;
         clang.enable = true;    
       };

    };
}



