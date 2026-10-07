{ den, ... }: {
  den.aspects.muhammadtalha = { user, ... }: {
    includes = [
      den.batteries.primary-user
      (den.batteries.user-shell "fish")
    ];
    user.hashedPassword = user.hashedPassword;

    # enable syncthing for user muhammadtalha
    provides.to-host.nixos.services.syncthing = {
      enable = true;
      dataDir = user.home;
      user = user.name;
      openDefaultPorts = true;
      overrideFolders = true;
      group = "users";
      settings = {
        devices = {
          myphone = {
            id = "7XVOG6S-6BTWJNS-MHZ4QLW-YG4NWLD-JHD7ODT-ANKSLBW-CQMTKVZ-PAYT2QV";
            addresses = [ "dynamic" ];
          };
        };
        folders = {
          "${user.home}/sync" = {
            enable = true;
            id = "sync";
            devices = [ "myphone" ];
          };
        };
      };
    };
  };
}
