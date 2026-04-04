{pkgs, ...}:

{

   programs.emacs = {
      enable = true;
      defaultEditor = true;      
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
            evil
            evil-collection
            evil-snipe
            evil-owl
            evil-vimish-fold
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

}
