{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.ydotool ];

  # uinput permissions
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="input"
  '';


  users.users.nansus.extraGroups = [ "input" "uinput" ];

  # optional: start ydotoold at boot for your user
  systemd.user.services.ydotoold = {
    description = "Ydotool daemon";
    serviceConfig = {
      ExecStart = "${pkgs.ydotool}/bin/ydotoold --socket-path=/run/user/%U/.ydotool_socket --socket-perm=0666";
    };
    wantedBy = [ "default.target" ];
  };

}
