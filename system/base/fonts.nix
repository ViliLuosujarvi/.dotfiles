{pkgs, ...}:

{
  # Add fonts to system
  #fonts.packages = with pkgs;
     #map (font: font.overrideAttrs {preferLocalBuild = true;}) [
	#roboto
	#noto-fonts
	#noto-fonts-cjk-sans
	#noto-fonts-cjk-serif
	#twemoji-color-font
	#font-awesome
	#victor-mono
	#iosevka-bin
	#noto-fonts-color-emoji

	#nerdfonts
	#nerd-fonts.fira-code
	#nerd-fonts.fira-mono
	#nerd-fonts.iosevka
	#nerd-fonts.mononoki
	
  #];

  # Add fonts to system
  fonts = {
	fontDir.enable = true;
	enableGhostscriptFonts = true;
	packages = with pkgs; [
     		map (font: font.overrideAttrs { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; }) [
		#roboto
		#noto-fonts
		#noto-fonts-cjk-sans
		#noto-fonts-cjk-serif	
		#twemoji-color-font
		font-awesome
		#victor-mono
		#iosevka-bin
		noto-fonts-color-emoji

		#nerdfonts
		nerd-fonts.fira-code
		nerd-fonts.fira-mono
		nerd-fonts.iosevka
		nerd-fonts.mononoki
		]
 	};	




  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Fira Code" ];
      sansSerif = [ "Fira Code" ];
      monospace = [ "Fira Code" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };  

}
