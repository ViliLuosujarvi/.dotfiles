{ pkgs, lib,  ... }:

{

 environment.systemPackages = with pkgs; [
   roccat-tools
 ]; 

}
