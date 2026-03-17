{ self, nixos-hardware, sops-nix, ... }:

{


  imports = [
    "${self}/hosts/Laptop/configuration.nix"
    nixos-hardware.nixosModules.lenovo-legion-16ithg6
    ./system/base/shells/zsh.nix
    sops-nix.nixosModules.sops
  ];


}
