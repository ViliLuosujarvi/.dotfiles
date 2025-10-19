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
    userName  = "ViliLuosujarvi";
    userEmail = "vili.luosujarvi@edu.lapinamk.fi";
  };

  programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    
    # theme options
    dracula-theme.theme-dracula
    silofy.hackthebox

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
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    #bash.enable = true;
    #zsh.enable = true;
  };

  # Enaable fastfetch to use custom filepath
  # for config.json 
  programs.fastfetch = {
    #enable = true;
    configFile = /home/your-username/.dtfiles/computer/.config/fastfetch/ci.json;
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
