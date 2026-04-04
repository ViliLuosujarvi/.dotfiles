{ pkgs, lib,  ... }:

{
 
  environment.systemPackages = [
    pkgs.kakoune
  ];
}
