{...}:

{
  # Configure keymap in X11
#  services.xserver.xkb = {
#    layout = "us";
#    variant = "";
#  };


  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us,fi";
    xkbOptions = "grp:alt_shift_toggle";
    exportConfiguration = true;
  };
}
