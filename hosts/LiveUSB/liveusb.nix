{ nixpkgs, lib, hostname, pkgs, ... }:

{
  imports = [ ];

  # ISO / USB image settings
  isoImage = {
    volumeID = lib.mkForce "nixos-live";
    isoName = lib.mkForce "nixos-live.iso";
    makeEfiBootable = true;
    makeUsbBootable = true;
    squashfsCompression = "lz4";
  };

  # Packages in live environment
  environment.systemPackages = with pkgs; [
    ripgrep
    fd
    tree
    unzip
    htop

    parted
    e2fsprogs
    dosfstools

    curl
    inetutils
    nmap

    kakoune
    kitty
];

  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

 services.gvfs.enable = false;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.root.password = "";

  system.stateVersion = "24.05";
}
