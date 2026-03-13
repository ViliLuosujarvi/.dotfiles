{ self, nixos-hardware, sops-nix, vscode-server, ... }:


# This is to make the flake.nix cleaner to read.
{

    "${self}/hosts/Laptop/configuration.nix"
    nixos-hardware.nixosModules.lenovo-legion-16ithg6
    ./system/base/shells/zsh.nix
    sops-nix.nixosModules.sops

}
