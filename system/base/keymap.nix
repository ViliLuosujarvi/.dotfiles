{...}:

{
  # Configure keymap in X11
#  services.xserver.xkb = {
#    layout = "us";
#    variant = "";
#  };


  # Configure keymap in X11
  services.xserver = {
    xgb.layout = "us,fi";
    xkbOptions = "grp:alt_shift_toggle";
    exportConfiguration = true;
  };
}
