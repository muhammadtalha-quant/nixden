{ pkgs, configDirectory, ... }:
{
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = false;
    };
    noctalia = {
      enable = true;
      recommendedServices.enable = true;
      systemd = {
        enable = true;
        target = "hyprland-session.target";
      };
    };
    localsend.enable = true;
    seahorse.enable = true;
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "kitty";
    };
    nh.flake = configDirectory;
    gnupg.agent = {
      pinentryPackage = pkgs.pinentry-gnome3;
      settings = {
        default-cache-ttl = 43200;
        max-cache-ttl = 43200;
      };
    };
  };
}
