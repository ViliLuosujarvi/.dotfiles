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
  ];

  #Enable git
  programs.git = {
    enable = true;
    userName  = "ViliLuosujarvi";
    userEmail = "vili.luosujarvi@edu.lapinamk.fi";
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
