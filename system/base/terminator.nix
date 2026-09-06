{ pkgs, ... }:

{

environment.systemPackages = with pkgs; [
  terminator
];

}

