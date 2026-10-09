{ inputs, ... }: {
  den.aspects.hyde = { user, ... }: {
    nixos = { pkgs, ... }: {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];
      fonts.packages = with pkgs; [
        newcomputermodern
        inter
        noto-fonts
        nerd-fonts.jetbrains-mono
        noto-fonts-color-emoji
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
          adw-gtk3
        ];
      };
      nixpkgs.config.allowUnfree = true;
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
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
    homeManager = { pkgs, ... }: {
      imports = [
        inputs.lazyvim.homeManagerModules.default
      ];
      programs.home-manager.enable = true;
      home = {
        pointerCursor.enable = true;
        packages = with pkgs; [
          pipes
          wl-clipboard
          cmatrix
          google-chrome
          obsidian
          nautilus
          papers
          showtime
          amberol
          file-roller
          loupe
          video-downloader
        ];
      };
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        extraLuaFiles = {
          "hyprland.events" = {
            content = ./_dotfiles/hypr/events.lua;
            autoLoad = true;
          };
          "hyprland.config" = {
            content = ./_dotfiles/hypr/config.lua;
            autoLoad = true;
          };
          "hyprland.rules" = {
            content = ./_dotfiles/hypr/rules.lua;
            autoLoad = true;
          };
          "hyprland.curves" = {
            content = ./_dotfiles/hypr/curves.lua;
            autoLoad = true;
          };
          "hyprland.animations" = {
            content = ./_dotfiles/hypr/animations.lua;
            autoLoad = true;
          };
          "hyprland.monitors" = {
            content = ./_dotfiles/hypr/monitors.lua;
            autoLoad = true;
          };
          "hyprland.gestures" = {
            content = ./_dotfiles/hypr/gestures.lua;
            autoLoad = true;
          };
          "lib.keys" = {
            content = ./_dotfiles/hypr/keys.lua;
            autoLoad = false;
          };
          "lib.helpers" = {
            content = ./_dotfiles/hypr/helpers.lua;
            autoLoad = false;
          };
          "hyprland.keys" = {
            content = ''
              require("hyprland.hotkeys.applications")
              require("hyprland.hotkeys.noctalia")
              require("hyprland.hotkeys.windows")
              require("hyprland.hotkeys.workspaces")
              require("hyprland.hotkeys.submaps")
            '';
            autoLoad = true;
          };
          "hyprland.hotkeys.applications" = {
            content = ./_dotfiles/hypr/applications.lua;
            autoLoad = false;
          };
          "hyprland.hotkeys.noctalia" = {
            content = ./_dotfiles/hypr/noctalia.lua;
            autoLoad = false;
          };
          "hyprland.hotkeys.windows" = {
            content = ./_dotfiles/hypr/windows.lua;
            autoLoad = false;
          };
          "hyprland.hotkeys.workspaces" = {
            content = ./_dotfiles/hypr/workspaces.lua;
            autoLoad = false;
          };
          "hyprland.hotkeys.submaps" = {
            content = ./_dotfiles/hypr/submaps.lua;
            autoLoad = false;
          };
        };
        extraConfig = ''
          require("noctalia")
        '';
      };
      programs = {

        starship = {
          enable = true;
          enableFishIntegration = true;
        };
        devenv = {
          enable = true;
          enableFishIntegration = true;
          settings = {
            version = 1;
            shell = {
              prompt_prefix = false;
            };
            tui = {
              statusline.enabled = false;
            };
          };
        };
        noctalia = {
          enable = true;
          systemd.enable = true;
          settings = ./_dotfiles/noctalia/config.toml;
        };
        cava = {
          enable = true;
          settings.color.theme = "noctalia";
        };
        btop = {
          enable = true;
          settings = {
            update_ms = 100;
            color_theme = "noctalia";
          };
        };
        lazygit.enable = true;

        lazyvim = {
          enable = true;
          ignoreBuildNotifications = true;
          extras = {
            coding.neogen.enable = true;
            test.core.enable = true;
            dap = {
              core.enable = true;
              nlua.enable = true;
            };
            editor = {
              harpoon2.enable = true;
              refactoring.enable = true;
            };
            lang = {
              nix.enable = true;
              markdown.enable = true;
              clangd.enable = true;
              cmake.enable = true;
              python.enable = true;
              json.enable = true;
              toml.enable = true;
              sql.enable = true;
              typst.enable = true;
              yaml.enable = true;
            };
          };
          configFiles = ./_dotfiles/lazyvim;
        };

        kitty = {
          enable = true;
          font = {
            name = "JetBrainsMono Nerd Font Mono";
            size = 14;
          };
          settings = {
            remember_window_size = false;
            cursor_trail = 1;
            background_opacity = 0.93;
            confirm_os_window_close = 0;
            enable_audio_bell = false;
            scrollback = "never";
            notify_on_cmd_finish = "invisible 5.0";
            hide_window_decorations = "yes";
            scrollback_lines = 100000;
            enabled_layouts = "splits,stack";
          };
          extraConfig = ''
            include themes/noctalia.conf
          '';
          shellIntegration.enableFishIntegration = true;
          enableGitIntegration = true;
          keybindings = {
            "ctrl+shift+c" = "copy_to_clipboard";
            "ctrl+shift+v" = "paste_from_clipboard";
            "ctrl+shift+up" = "scroll_line_up";
            "ctrl+shift+down" = "scroll_line_down";
            "page_up" = "scroll_page_up";
            "page_down" = "scroll_page_down";
            "ctrl+shift+enter" = "no_op";
            "ctrl+alt+enter" = "no_op";
            "ctrl+alt+left" = "no_op";
            "ctrl+alt+right" = "no_op";
            "ctrl+alt+up" = "no_op";
            "ctrl+alt+down" = "no_op";
            "ctrl+shift+home" = "no_op";
            "ctrl+left" = "no_op";
            "ctrl+right" = "no_op";
            "ctrl+up" = "no_op";
            "ctrl+down" = "no_op";
            "ctrl+shift+equal" = "change_font_size all +2.0";
            "ctrl+shift+minus" = "change_font_size all -2.0";
            "ctrl+shift+backspace" = "change_font_size all 0";
          };
        };

        git = {
          enable = true;
          signing = {
            key = user.publicGPGKey;
            format = "openpgp";
            signByDefault = true;
            signer = "/run/current-system/sw/bin/gpg2";
          };
          settings = {
            init = {
              defaultBranch = "main";
            };
            commit = {
              gpgSign = true;
            };
            tag = {
              gpgSign = true;
            };
            user = {
              name = user.realName;
              email = user.emailAddress;
              useConfigOnly = true;
            };
            credential = {
              "https://github.com" = {
                helper = "/run/current-system/sw/bin/gh auth git-credential";
              };
              "https://gist.github.com" = {
                helper = "/run/current-system/sw/bin/gh auth git-credential";
              };
            };
            http = {
              version = "HTTP/1.1";
              postBuffer = 524288000;
              lowSpeedLimit = 1000;
              lowSpeedTime = 600;
            };
          };
        };
        fish = {
          enable = true;
          shellAbbrs = {
            ls = "eza --icons";
            lla = "eza -lgaoh --icons --git";
            ll = "eza -lgoh --icons --git";
            lf = "eza -goh --icons --only-files --show-symlinks --git";
            ldir = "eza -goh --icons --only-dirs --show-symlinks --git";
            laf = "eza -gaoh --icons --only-files --show-symlinks --git";
            ladir = "eza -gaoh --icons --only-dirs --show-symlinks --git";
            llaf = "eza -lgaoh --icons --only-files --show-symlinks --git";
            lladir = "eza -lgaoh --icons --only-dirs --show-symlinks --git";
            llf = "eza -lgoh --icons --only-files --show-symlinks --git";
            lldir = "eza -lgoh --icons --only-dirs --show-symlinks --git";
            la = "eza -ah --icons";
            lt = "eza --tree --git";
            "000" = "chmod 000";
            "644" = "chmod 644";
            "666" = "chmod 666";
            "755" = "chmod 755";
            "777" = "chmod 777";
            "000r" = "chmod -R 000";
            "644r" = "chmod -R 644";
            "666r" = "chmod -R 666";
            "755r" = "chmod -R 755";
            "777r" = "chmod -R 777";
            snano = "sudo nano";
            mkdir = "mkdir -p";
            sumkdir = "sudo mkdir -p";
            cp = "cp -rv";
            mv = "mv -v";
            rm = "rm -frv";
            less = "less -R";
            sucp = "sudo cp -rv";
            sumv = "sudo mv -v";
            surm = "sudo rm -frv";
            cls = "clear";
          };
          preferAbbrs = true;
          shellAliases = {
            home = "cd ~";
            ".." = "cd ..";
            "..." = "cd ../..";
            "...." = "cd ../../..";
            v = "nvim";
            vi = "nvim";
            vim = "nvim";
            cat = "bat";
            matrix = "cmatrix -rsbu5";
            pipes = "pipes.sh -p4 -r4000 -R";
          };
          shellInit = ''
            set -U fish_greeting 
          '';
          plugins = with pkgs.fishPlugins; [
            {
              name = "autopair";
              inherit (autopair) src;
            }
          ];
          functions.clh.body = ''
            echo yes | history clear
            clear && fish
          '';
        };
      };
      home = {
        pointerCursor = {
          name = "catppuccin-macchiato-mauve-cursors";
          size = 26;
          package = pkgs.catppuccin-cursors.macchiatoMauve;
          gtk.enable = true;
          hyprcursor.enable = true;
        };
      };
      xdg = {
        portal = {
          enable = true;
          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
            pkgs.xdg-desktop-portal-hyprland
          ];
          config = {
            common = {
              default = [
                "gtk"
              ];
              "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
              "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
            };
          };
        };
        userDirs.enable = true;
        localBinInPath = true;
        mimeApps = {
          enable = true;
          defaultApplicationPackages = with pkgs; [
            neovim
            nautilus
            file-roller
            papers
            amberol
            showtime
            loupe
          ];
        };
      };
      gtk = {
        enable = true;
        font = {
          name = "Inter Variable";
          package = pkgs.inter;
          size = 11;
        };
        iconTheme = {
          package = pkgs.catppuccin-papirus-folders.override {
            flavor = "macchiato";
            accent = "mauve";
          };
          name = "Papirus";
        };
      };
      fonts.fontconfig = {
        enable = true;
        antialiasing = true;
        defaultFonts = {
          monospace = [ "Noto Sans" ];
          sansSerif = [ "Inter Variable" ];
          serif = [ "JetBrainsMono Nerd Font Mono" ];
          emoji = [ "Noto Color Emoji" ];
        };
      };
    };
  };
}
