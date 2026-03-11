{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     fzf
     lsd
     #zsh
     #oh-my-zsh
     #oh-my-posh

  ];

  programs = {
  # Zsh configuration
      zsh = {
    	enable = true;
	enableCompletion = true;
      ohMyZsh = {
        enable = true;
	plugins = ["git" 
		 "virtualenv" 
		 "direnv"	
		];
	theme = "";
	# good ones been:
	# jonathan, candy, gnzh,
	# strug, xiong-chiamiov,
 	# //kennethreitz\\, ys.
	# frontcube, rkj-repos,
	# kennethreitz  
      	};
      
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      promptInit = ''
	
	# current custom zsh theme is stored here
	source .dotfiles/system/base/shells/oh-my-zsh/custom/themes/zsh_theme

        # Set-up icons for files/folders in terminal using lsd
        alias ls='lsd'
        alias l='ls -l'
        alias la='ls -a'
        alias lla='ls -la'
        alias lt='ls --tree'

	# annoying as hell to have .dotfiles and .dotnet
	# in a same place.
	alias .d='cd ; cd .dotfiles'
	alias .s='cd ; cd .dotfiles/system/'

	# Annoying as hell to also have swaybg and swayimg
	alias .si='swayimg'
	alias .f='cd ; cd school_stuff/Fontys_2026/'


	# And here just to ease my workflow,
	# some aliases to jump to computer configs
	alias .home-desktop='cd ; cd .dotfiles/hosts/Home-Desktop/'
	alias .laptop='cd ; cd .dotfiles/hosts/Laptop/'
	alias .slave='cd ; cd .dotfiles/hosts/Slave'

	alias .dc='cd ; cd .dotfiles/hosts/Home-Desktop/.config/'
	alias .lc='cd ; cd .dotfiles/hosts/Laptop/.config/'
	alias .sc='cd ; cd .dotfiles/hosts/Slave/.config/'

	# History files
        source <(fzf --zsh);
        HISTFILE=~/.zsh_history;
        HISTSIZE=10000;
        SAVEHIST=10000;
        setopt appendhistory;
        '';
      }; 
   };

  # Set ZSH as default shell for nansus
  users.users.nansus = {   
    shell = pkgs.zsh;
    };
 
  environment.shells = with pkgs; [ zsh ];
}
