{
  de.hyprland = {
    nixos = {
      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        withUWSM = false;
      };
    };
    homeManager = {
      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        extraLuaFiles = {
          "hyprland.events" = {
            content = ./hyprland.lua/events.lua;
            autoLoad = true;
          };
          "hyprland.config" = {
            content = ./hyprland.lua/config.lua;
            autoLoad = true;
          };
          "hyprland.rules" = {
            content = ./hyprland.lua/rules.lua;
            autoLoad = true;
          };
          "hyprland.curves" = {
            content = ./hyprland.lua/curves.lua;
            autoLoad = true;
          };
          "hyprland.animations" = {
            content = ./hyprland.lua/animations.lua;
            autoLoad = true;
          };
          "hyprland.monitors" = {
            content = ./hyprland.lua/monitors.lua;
            autoLoad = true;
          };
          "hyprland.gestures" = {
            content = ./hyprland.lua/gestures.lua;
            autoLoad = true;
          };
          "lib.keys" = {
            content = ./hyprland.lua/keys.lua;
            autoLoad = false;
          };
          "lib.helpers" = {
            content = ./hyprland.lua/helpers.lua;
            autoLoad = false;
          };
          "hyprland.keybindings" = {
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
            content = ./hyprland.lua/applications.lua;
            autoLoad = false;
          };
          "hyprland.hotkeys.noctalia" = {
            content = ./hyprland.lua/noctalia.lua;
            autoLoad = false;
          };
          "hyprland.hotkeys.windows" = {
            content = ./hyprland.lua/windows.lua;
            autoLoad = false;
          };
          "hyprland.hotkeys.workspaces" = {
            content = ./hyprland.lua/workspaces.lua;
            autoLoad = false;
          };
          "hyprland.hotkeys.submaps" = {
            content = ./hyprland.lua/submaps.lua;
            autoLoad = false;
          };
        };
      };
    };
  };
}
