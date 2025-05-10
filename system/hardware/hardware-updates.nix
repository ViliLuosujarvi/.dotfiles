{ config, pkgs, ... }:

{
  imports =
    [ 
      # Install newest updates on the software
      "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/lenovo/legion/t526amr5"      
    ];
}
