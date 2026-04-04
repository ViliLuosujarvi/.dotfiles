{ config, pkgs, ... }:

{
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
	git
	gh
	# faster grep
	ripgrep
  ];

  # Kitty config :3
  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 10;
    };
  };
  
  # Enable Fira Code as default font
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      #monospace = [ "FiraCode Nerd Font" "DroidSansMono Nerd Font" "JetBrainsMono Nerd Font" ];
    
      serif = [ "Fira Serif Nerd Font" ];
      sansSerif = [ "Fira Code Nerd Font" ];
      monospace = [ "Fira Code Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
      };
  };

  #Enable git
  programs.git = {
    enable = true;
    settings = {
       user = {
          Name =  "ViliLuosujarvi";
          Email = "vili.luosujarvi@edu.lapinamk.fi";
       };
    };
    #userName  = "ViliLuosujarvi";
    #userEmail = "vili.luosujarvi@edu.lapinamk.fi";
  };

  # Enable vscode
  programs.vscode = {
  enable = true;
  # and extensions
  profiles.default.extensions = with pkgs.vscode-extensions; [
    
    # theme options
    dracula-theme.theme-dracula
    #silofy.hackthebox
    #thorerik.hacker-theme

    # Basic ML
    #vscodevim.vim
    ms-python.python
    ms-toolsai.jupyter
    
    # ML visualization
    #wholroyd.jinja
    mechatroner.rainbow-csv
   
    # miscellaneous
    #tekumara.typos-vscode
    ];
  };

  # Enable DirEnv
  programs = {
    direnv = {
      enable = true;
      #enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    #bash.enable = true;
    #zsh.enable = true;
  };

   programs.emacs = {
      enable = true;
      #defaultEditor = true;      
      package = pkgs.emacs-pgtk;
      extraPackages =
          epkgs: with epkgs; [
            org-modern
            olivetti
            command-log-mode
            vertico
            corfu
            hotfuzz
            orderless
            #evil
            #evil-collection
            #evil-snipe
            #evil-owl
            #evil-vimish-fold
            dashboard
            doom-themes
            doom-modeline
            nerd-icons
            nerd-icons-dired
            nerd-icons-corfu
            nerd-icons-ibuffer
            nerd-icons-completion
            yasnippet
            shackle
            projectile
            treemacs
            treemacs-projectile
            treemacs-evil
            treemacs-nerd-icons
            treesit-grammars.with-all-grammars
            git-timemachine
            wgrep
            magit
            magit-todos
            undo-fu
            undo-fu-session
            org-roam
            org-node
            org-node-fakeroam
            vterm
            vterm-toggle
            sudo-edit
            direnv
            svelte-mode
            typescript-mode
            sass-mode
            rainbow-mode
   	   ];
	   
	   extraConfig = ''
		(setq treesit-auto-install 'prompt)
		'';
	};

  home.file = {
     ".config" = {
	source = ./.config;
	recursive = true;
     };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
