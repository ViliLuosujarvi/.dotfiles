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

}
