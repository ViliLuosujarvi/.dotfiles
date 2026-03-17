networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
    ];
    ensureProfiles = {
      profiles.myVpn = {
        connection = {
          id = "Name in the NM";
          type = "vpn";
        };
        vpn = rec {
          # set these to your params
          gateway = "vpn.url";
          remote = gateway;
          username = "username";

          service-type = "org.freedesktop.NetworkManager.openconnect";
          protocol = "anyconnect";
          useragent = "AnyConnect";
          authtype = "password";
        };
      };
    };
  };
