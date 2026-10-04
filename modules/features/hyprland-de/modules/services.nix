{
  users,
  ...
}:
{
  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
    fprintd.enable = true;
    udisks2.enable = true;
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    displayManager.ly.enable = true;
    libinput.enable = true;
    pcscd.enable = true;
    syncthing = {
      enable = true;
      dataDir = "/home/${users.primary.userName}/";
      user = users.primary.userName;
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
          "/home/${users.primary.userName}/sync" = {
            enable = true;
            id = "sync";
            devices = [ "myphone" ];
          };
        };
      };
    };
  };
}
