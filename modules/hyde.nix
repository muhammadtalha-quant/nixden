{
  den.aspects.hyde = {
    nixos = { pkgs, ... }: {
      fonts.packages = with pkgs; [
        newcomputermodern
      ];
      environment = {
        sessionVariables = {
          EDITOR = "nvim";
          VISUAL = "nvim";
          QT_QPA_PLATFORM = "wayland;xcb";
          NIXOS_OZONE_WL = "1";
        };
        systemPackages = with pkgs; [
          gpu-screen-recorder
          rar
          unar
        ];
      };
      networking = {
        firewall = {
          allowedTCPPorts = [ 53317 ];
          allowedUDPPorts = [ 53317 ];
        };
      };
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
      };
      security = {
        rtkit.enable = true;
        pam.services.greetd = {
          enableGnomeKeyring = true;
          fprintAuth = true;
        };
      };
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
        gnupg.agent = {
          pinentryPackage = pkgs.pinentry-gnome3;
          settings = {
            default-cache-ttl = 43200;
            max-cache-ttl = 43200;
          };
        };
      };
    };
  };
}
