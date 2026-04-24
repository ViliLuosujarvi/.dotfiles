{pkgs, ...}:

{
  # Add fonts to system
  fonts.packages = with pkgs;
     map (font: font.overrideAttrs {preferLocalBuild = true;}) [
	roboto
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
        nerd-fonts.hack
        

	cascadia-code
	hack-font
	inconsolata
	source-code-pro
	nunito
	corefonts
        hack-font
        manrope
        noto-fonts
        noto-fonts-emoji
  ];


  # Enable Fira Code as default font
   fonts.fontconfig = {
     enable = true;
     defaultFonts = {
       #monospace = [ "FiraCode Nerd Font" "DroidSansMono Nerd Font" "JetBrainsMono Nerd Font" ];
     
       #serif = [ "Fira Serif Nerd Font" ];
       #sansSerif = [ "Fira Code Nerd Font" ];
       #monospace = [ "Fira Code Nerd Font" ];
       #emoji = [ "Noto Color Emoji" ];

       sansSerif = [ "Manrope" ];
       serif = [ "Manrope" ];
       monospace = [ "Hack Nerd Font" ];
       emoji = [ "Noto Color Emoji" ];


       };

   };
}
