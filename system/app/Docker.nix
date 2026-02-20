{ pkgs, lib, ...}:

{

# install Docker
virtualisation.docker.enable = true;

# add user to 
users.users.nansus.extraGroups = [ "docker" ];

}
