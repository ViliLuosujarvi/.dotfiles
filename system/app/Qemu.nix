{ pkgs, lib,  ... }:

{

  environment.systemPackages = [
    pkgs.qemu
  ];

}
