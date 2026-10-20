{
  de.noctalia = {
    nixos = {
      programs.noctalia = {
        enable = true;
        recommendedServices.enable = true;
        systemd = {
          enable = true;
          target = "hyprland-session.target";
        };
      };
    };
    homeManager = {
      noctalia = {
        enable = true;
        systemd.enable = true;
        settings = ./noctalia.toml/config.toml;
      };
    };
  };
}
