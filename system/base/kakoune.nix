{ pkgs, lib,  ... }:

{

  # Happy kakoune user since 13/04/2026 :)
  environment.systemPackages = [
    pkgs.kakoune
  ];
}
