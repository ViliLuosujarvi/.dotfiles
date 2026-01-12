{pkgs, ... }:

{
  #Enable Hyprland
  programs.hyprland = {
     enable = true;
     xwayland.enable = true;

  };

environment.systemPackages = with pkgs; [
     # Hyprland related software
     # that I tend to utilize as
     # "base" for hyprland system
     # always, choose yourself ig
#     kitty
     waybar
     hyprpaper
#     wpaperd
#     mpvpaper
     swaybg
     swww
     nerdfetch
     rofi
     brightnessctl
     fastfetch
     wallust
  ];
  
}
