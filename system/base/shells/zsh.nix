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
	alias .d='cd .dotfiles'
	alias .system='cd .dotfiles/system/'
	alias .home-desktop='cd .dotfiles/hosts/Home-Desktop/'
	alias .laptop='cd .dotfiles/hosts/Laptop/'
	alias .slave='cd .dotfiles/hosts/Slave'

	# and now for a good run some common 
	# git aliases aswell.
	#alias ga='git add'
	#alias gc='git commit --verbose' 

        source <(fzf --zsh);
        HISTFILE=~/.zsh_history;
        HISTSIZE=800;
        SAVEHIST=800;
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
