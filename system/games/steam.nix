{ pkgs, ... }:

{
  #environment.systemPackages = with pkgs; [ steam mangohud protonup-qt lutris bottles heroic ];

  programs = {
       steam = {
          enable = true;
	  # Open ports in the firewall for Steam Remote Play
  	  remotePlay.openFirewall = true;
	  # Open ports in the firewall for Source Dedicated Server
  	  dedicatedServer.openFirewall = true;
	  # Open ports in the firewall for Steam Local Network Game Transfers
  	  localNetworkGameTransfers.openFirewall = true;
       }; 
   };

  # Additional 32bit graphics driver
  hardware.opengl.driSupport32Bit = true;

}
