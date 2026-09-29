{
  programs = {
    kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font Mono";
        size = 14;
      };
      settings = {
        remember_window_size = false;
        cursor_trail = 1;
        background_opacity = 0.80;
        confirm_os_window_close = 0;
        enable_audio_bell = false;
        scrollback = "never";
        notify_on_cmd_finish = "invisible 5.0";
        hide_window_decorations = "yes";
        scrollback_lines = 100000;
        enabled_layouts = "splits,stack";
      };
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
  };
}
