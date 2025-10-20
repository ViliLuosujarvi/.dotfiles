{pkgs, ... }:

{

environment.systemPackages = with pkgs; [

   # screenshots
   grimblast

   hyprshot
   hyprpicker

   # photo modification
   gimp

   # image viewer
   swayimg
  ];
  
}

# Gimp is set to be the default photo modification program in .config/hyper/UserConfigs/ENVariables
# (atleast in laptop configs at the time of writing this. :D)

# Keybinds can be found from .config/hypr/hyprland.conf
