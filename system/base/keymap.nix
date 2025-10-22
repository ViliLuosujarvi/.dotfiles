{...}:

{
  # Configure keymap in X11
#  services.xserver.xkb = {
#    layout = "us";
#    variant = "";
#  };


# better to handle this trough
# hyprlands own multi language
# keyboard configurations:
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us,fi";
    xkbOptions = "grp:alt_shift_toggle";
    exportConfiguration = true;
  };
}
