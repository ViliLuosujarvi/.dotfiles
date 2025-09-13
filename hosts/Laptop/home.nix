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
	kitty
	ripgrep
  ];

  #Enable git
  programs.git = {
    enable = true;
    userName  = "ViliLuosujarvi";
    userEmail = "vili.luosujarvi@edu.lapinamk.fi";
  };

  # Enable vscode
  programs.vscode = {
  enable = true;
  # and extensions
  extensions = with pkgs.vscode-extensions; [
    
    # theme options
    dracula-theme.theme-dracula
    silofy.hackthebox
    thorerik.hacker-theme

    # Basic ML
    vscodevim.vim
    ms-python.python
    ms-toolsai.jupyter
    
    # ML visualization
    #wholroyd.jinja
    mechatroner.rainbow-csv
   
    # miscellaneous
    tekumara.typos-vscode
    ];
  };

  # Enable DirEnv
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    #bash.enable = true;
    #zsh.enable = true;
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
