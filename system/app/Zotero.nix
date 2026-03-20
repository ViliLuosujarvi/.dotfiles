{ pkgs, lib, ...}:

{

  environment.systemPackages = [
    pkgs.zotero
    jdk

  ];

}
