{
  # might be too much to describe what happens in description
  description = "flake for my computers and servers";

  # pkgs imported from git and such
  inputs = {
    # nix pkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Home-mnanger and it is set to follow same nixpkgs version
    # as nixpkgs.url has been set to.
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Most of my machines can be found on nixos-hardware
    # repo so I'm using them there. if you are more interested,
    # Slave is custom built computer which doesn't have 
    # configuration in nixos-hardware, check:
    # .dotfiles/system/hardware/nividia_proprietary.nix or
    # https://nixos.wiki/wiki/Nvidia for more info
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # flake utils, might need.
    flake-utils.url = "github:numtide/flake-utils";

    # prettier cursor, change with your
    # own preference as they can be found
    # in myriad forms in git repos
    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
    };

    # Import hyprland even tough I know in my heart that
    # this doens't do shit
    # in my configuration because I have been so lazy to 
    # not change hyprland.nix file in system/base/ :(
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # not in use at the moment, could be just
    # removed from this file entirely, 
    # will be here just temporarily (clueless)
    hyprlang = {
      url = "github:hyprwm/hyprlang";
      #inputs.system.follows = "system";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # sops-nix for ecrets management
    # (still under maintanance aka I haven't had
    # time nor motivaion to learn this yet so far 
    # to actually implement it as safe solution)
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    # VSCode server for running e.g jupyter server for
    # machine learning purposes
    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  # Here the machine output that is result of
  # inputs given above and a modular set of .nix files
  # other pkgs, tadaa!
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

    # "let in" couple of more used blocks of informations
    # like system versions as $system and so on to
    # nixosConfiguration and homeConfiguration.
    let

      # ---- SYSTEM SETTINGS ----
        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = import nixpkgs {
	     inherit system;
           # Allow unfree because I happen
	   # to still use software that is not
	   # all open-source, my bad!
  	   config.allowUnfree = true;
	};
    in {

      # Nixos configuration set for Home-Desktop,
      # Laptop and Slave. Anything else is a demo
      # until further declared
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
	# to run ML calculations (hence the machine name xd)
        Slave = lib.nixosSystem {
          inherit system;
          modules = [
            "${self}/hosts/Slave/configuration.nix"
      	    ./system/base/shells/zsh.nix
	    sops-nix.nixosModules.sops
	    
	    # in case you are wondering, Slave machine
	    # is declader in it's configuration.nix as 
	    # in .dotfiles/system/hardware/nvidia/proprietary.nix

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

      # Home configuration for Home-Desktop Laptop and Slave.
      # Anything else is demo testing:

      # Basic information regarding all home configurations 
      homeConfigurations = let basics = {
              home.username = "nansus";
              home.homeDirectory = "/home/nansus";
              home.stateVersion = "24.11";
	      
	      # Enable home manager
              programs.home-manager.enable = true;
              };
          in {

	# unerneath are all different configurations
	# for the given machines and their home.nix
	# files can be found from each ones own hosts/
	# section in the .dotfiles
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
