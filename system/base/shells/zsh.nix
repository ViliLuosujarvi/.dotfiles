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
		 "vi-mode"	
		];
        theme = "zsh_theme";
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
        # Set-up icons for files/folders in terminal using lsd
        alias ls='lsd'
        alias l='ls -l'
        alias la='ls -a'
        alias lla='ls -la'
        alias lt='ls --tree'

        source <(fzf --zsh);
        HISTFILE=~/.zsh_history;
        HISTSIZE=10000;
        SAVEHIST=10000;
        setopt appendhistory;
        '';
      };

     # Put your custom theme into oh-my-zsh's custom dir
    xdg.configFile."oh-my-zsh/custom/themes/mytheme.zsh-theme".source =
      ./../../../.config/oh-my-zsh/custom/themes; 
   };
 
  # Set ZSH as default shell for nansus
  users.users.nansus = {   
    shell = pkgs.zsh;
    };
 
  environment.shells = with pkgs; [ zsh ];
}
