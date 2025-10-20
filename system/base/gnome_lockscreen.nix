{pkgs, ...}:

{

  # You may change gnome lockscreen to something else, but think of it as the
  # same type of effect as with the The Garden of Earthly delights, bland exterior
  # and colorful interior

  # Enable gnome based lockscreen
  services.xserver = {
     enable = true;
     displayManager.gdm.enable = true;

  };

}
