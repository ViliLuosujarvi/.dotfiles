{ config, lib, pkgs, ... }:

{

   # Enable OpenGL
   hardware.graphics = {
      enable = true;
   };

   # Load nvidia drivers for wayland
   services.xserver.videoDrivers = [ "nvidia" ];

   hardware.nvidia = {

      # nvidia modesetting, required
      modesetting.enable = true;

      #Power management
      powermanagement.enable = false;

      # Fine grained poweromanagement, only for
      # never gpu's(Turing ->)
      powermanagement.finegrained = false;

      # Open version of nvidia proprietary drivers,
      # (not to be confused for 'noveau')
      open = false;

      # Enable nvidia-settings menu
      nvidiaSettings = true;

      # Driver version
      package = config.boot.kernelPackages.nvidiaPackages.dc;


   };
}
