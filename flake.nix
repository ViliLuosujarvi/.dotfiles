{
  description = "NanSuS Desktop flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    flake-utils.url = "github:numtide/flake-utils";

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprlang = {
      url = "github:hyprwm/hyprlang";
      inputs.system.follows = "system";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs = {

      self,
      nixpkgs, 
      flake-utils,
      hyprland,
      hyprlang,
      home-manager,
      nixos-hardware,
      sops-nix,
      vscode-server,
      rose-pine-hyprcursor
     
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
	# Leisure configuration for Home-Desktop
        Home-Desktop = lib.nixosSystem {
          inherit system;
          modules = [
             "${self}/hosts/Home-Desktop/configuration.nix"
             nixos-hardware.nixosModules.lenovo-legion-t526amr5
             ./system/base/shells/zsh.nix
	     sops-nix.nixosModules.sops

	     # remember to run this on host machine:
	     # systemctl --user enable auto-fix-vscode-server.service
	     vscode-server.nixosModules.default
             ({ config, pkgs, ... }: {
                services.vscode-server.enable = true;
	     })
          ];
          specialArgs = {
            inherit inputs pkgs;
          };
        };
	# Work mode for Home-Desktop
	Home-Desktop-Work = lib.nixosSystem {
	  inherit system;
	  modules = [
	     "${self}/hosts/Work/Home-Desktop-Work/configuration.nix"
	     nixos-hardware.nixosModules.lenovo-legion-t526amr5
             ./system/base/shells/zsh.nix
	     sops-nix.nixosModules.sops
	  ];
	  specialArgs = {
	    inherit inputs pkgs;
	  };
	};
	# Leisure configuration for home Laptop
        Home-Laptop = lib.nixosSystem {
          inherit system;
          modules = [
             "${self}/hosts/Laptop/configuration.nix"
	    nixos-hardware.nixosModules.lenovo-legion-16ithg6
      	    ./system/base/shells/zsh.nix
	    sops-nix.nixosModules.sops
          ];
          specialArgs = {
            inherit inputs pkgs;
          };
        };
	# Work configuration for home Laptop
        Home-Laptop-Work = lib.nixosSystem {
          inherit system;
          modules = [
             "${self}/hosts/Work/Home-Laptop-Work/configuration.nix"
	   nixos-hardware.nixosModules.lenovo-legion-16ithg6
      	   ./system/base/shells/zsh.nix
	   sops-nix.nixosModules.sops
          ];
          specialArgs = {
            inherit inputs pkgs;
          };
        };
	# Basic configuration for Slave machine
	# to run ML calculations
        Slave = lib.nixosSystem {
          inherit system;
          modules = [
             "${self}/hosts/Slave/configuration.nix"
      	    ./system/base/shells/zsh.nix
	    sops-nix.nixosModules.sops

	    # remember to run this on host machine:
	    # systemctl --user enable auto-fix-vscode-server.service
            vscode-server.nixosModules.default
            ({ config, pkgs, ... }: {
               services.vscode-server.enable = true;
	    })
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

	"nansus@Home-Desktop-Work" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
	     		"${self}/hosts/Work/Home-Desktop-Work/home.nix"
  	     	basics
          ];
        };

        "nansus@Home-Laptop" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
    	      "${self}/hosts/Laptop/home.nix"
	        	basics
          ];
        };

        "nansus@Home-Laptop-Work" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
    	     "${self}/hosts/Work/Home-Laptop-Work/home.nix"
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
