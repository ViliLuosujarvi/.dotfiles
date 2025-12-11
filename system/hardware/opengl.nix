{ pkgs, ... }:

{
  # OpenGL
#  hardware.opengl.enable = true;
#  hardware.opengl.extraPackages = with pkgs; [
#    rocmPackages.clr.icd
#  ];

  # OpenGL
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];

  # Additional 32bit graphics driver can be found
  # in system/games/steam.nix for games mostly

}
