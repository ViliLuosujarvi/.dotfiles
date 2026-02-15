{pkgs, lib, ...}:

{
programs.virt-manager.enable = true;

users.groups.libvirtd.members = ["nansus"];

virtualisation.libvirtd.enable = true;

virtualisation.spiceUSBRedirection.enable = true;
}
