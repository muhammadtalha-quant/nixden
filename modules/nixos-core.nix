{
  den.aspects.nixos-core = {
    nixos = { pkgs, ... }: {
      boot = {
        loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
        };
        kernelPackages = pkgs.linuxPackages_latest;
        tmp.cleanOnBoot = true;
      };
      i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
          LC_ADDRESS = "en_US.UTF-8";
          LC_IDENTIFICATION = "en_US.UTF-8";
          LC_MEASUREMENT = "en_US.UTF-8";
          LC_MONETARY = "en_US.UTF-8";
          LC_NAME = "en_US.UTF-8";
          LC_NUMERIC = "en_US.UTF-8";
          LC_PAPER = "en_US.UTF-8";
          LC_TELEPHONE = "en_US.UTF-8";
          LC_TIME = "en_US.UTF-8";
        };
      };
      networking = {
        firewall.enable = true;
        networkmanager.enable = true;
      };
      nix = {
        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          trusted-users = [
            "root"
            "@wheel"
          ];
        };
        optimise = {
          automatic = true;
          dates = [ "09:00:00" ];
        };
      };
      services.dbus.enable = true;
      services.envfs.enable = true;

      hardware = {
        enableAllFirmware = true;
        enableAllHardware = true;
      };
      programs = {
        gnupg = {
          agent.enable = true;
          agent.enableSSHSupport = true;
        };
      };
      environment = {
        sessionVariables = {
          LANG = "en_US.UTF-8";
        };
        systemPackages = with pkgs; [
          nix-output-monitor
          ripgrep
          _7zz
          zip
          eza
          bat
          unzip
          git
          gh
          vim
          neovim
          microfetch
        ];
      };
    };
  };
}
