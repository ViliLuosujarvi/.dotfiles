{
  description = "NanSuS Desktop flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    flake-utils.url = "github:numtide/flake-utils";

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
  };



  };

  outputs = {

      self,
      nixpkgs, 
      flake-utils,
      hyprland,
      home-manager,
      nixos-hardware
     
      }@inputs:


    let

      # ---- SYSTEM SETTINGS ----
        system = "x86_64-linux";
        lib = nixpkgs.lib;
        #pkgs = nixpkgs.legacyPackages."x86_64-linux";
	pkgs = import nixpkgs {
	     inherit system;
  	   config.allowUnfree = true;
	};
    in {
      nixosConfigurations = {
        Home-Desktop = lib.nixosSystem {
          inherit system;
          modules = [
             "${self}/hosts/Home-Desktop/configuration.nix"
             nixos-hardware.nixosModules.lenovo-legion-t526amr5
        	   ./system/base/shells/zsh.nix
          ];
          specialArgs = {
            inherit inputs pkgs;
          };
        };
        NanSuS-Laptop = lib.nixosSystem {
          inherit system;
          modules = [
             "${self}/hosts/Laptop/configuration.nix"
             nixos-hardware.nixosModules.lenovo-legion-16iah7h
      	    ./system/base/shells/zsh.nix
          ];
          specialArgs = {
            inherit inputs pkgs;
          };
        };
        Slave = lib.nixosSystem {
          inherit system;
          modules = [
             "${self}/hosts/Slave/configuration.nix"
      	    ./system/base/shells/zsh.nix
          ];
          specialArgs = {
            inherit inputs pkgs;
          };
        };
      };

      homeConfigurations = let basics = {
              home.username = "nansus";
              home.homeDirectory = "/home/nansus";
              home.stateVersion = "24.11";
	      
              programs.home-manager.enable = true;
              };
          in {
        "nansus@Home-Desktop" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
	      		"${self}/hosts/Home-Desktop/home.nix"
  	      	basics
          ];
        };
        "nansus@NanSuS-Laptop" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
    	      "${self}/hosts/Laptop/home.nix"
	        	basics
          ];
        };
        "nansus@Slave" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
	      		"${self}/hosts/Slave/home.nix"
						basics
          ];
        };
      };
    };
}
