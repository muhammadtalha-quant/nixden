hl.config({
  input = {
    kb_layout = "us",
    kb_options = "compose:ralt",
    numlock_by_default = true,
    repeat_delay = 250,
    repeat_rate = 35,

    follow_mouse = 1,
    off_window_axis_events = 2,

    touchpad = {
      natural_scroll = true,
      disable_while_typing = true,
      clickfinger_behavior = true,
      scroll_factor = 0.7
    }
  },
  gestures = {
    workspace_swipe_distance = 700,
    workspace_swipe_cancel_ratio = 0.2,
    workspace_swipe_min_speed_to_force = 5,
    workspace_swipe_direction_lock = true,
    workspace_swipe_direction_lock_threshold = 10,
    workspace_swipe_create_new = true
  },
  general = {
    gaps_in = 4,
    gaps_out = 8,
    gaps_workspaces = 50,

    border_size = 1,

    resize_on_border = true,

    no_focus_fallback = true,
    allow_tearing = true,
    snap = {
      enabled = true,
      window_gap = 4,
      monitor_gap = 5,
      respect_gaps = true
    }
  },
  decoration = {
    rounding_power = 2,
    rounding = 15,
    blur = {
      enabled = true,
      xray = true,
      special = false,
      new_optimizations = true,
      size = 9,
      passes = 2,
      ignore_opacity = true,
      brightness = 1,
      noise = 0.05,
      contrast = 0.89,
      vibrancy = 0.5,
      vibrancy_darkness = 0.5,
      popups = false,
      popups_ignorealpha = 0.6,
      input_methods = true,
      input_methods_ignorealpha = 0.8
    },
    shadow = {
      enabled = true,
      range = 20,
      offset = { 0, 2 },
      render_power = 10,
    },
    -- Dim
    dim_inactive = true,
    dim_strength = 0.05,
    dim_special = 0.2
  },
  animations = {
    enabled = true
  },
  dwindle = {
    preserve_split = true,
    force_split = 2,
    smart_split = false,
    smart_resizing = false
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    vrr = 0,
    mouse_move_enables_dpms = true,
    key_press_enables_dpms = true,
    animate_manual_resizes = false,
    animate_mouse_windowdragging = false,
    enable_swallow = false,
    swallow_regex = "(foot|kitty|allacritty|Alacritty)",
    on_focus_under_fullscreen = 2,
    allow_session_lock_restore = true,
    session_lock_xray = true,
    initial_workspace_tracking = false,
    focus_on_activate = true
  },

  binds = {
    scroll_event_delay = 0,
    hide_special_on_workspace_change = true
  },

  cursor = {
    zoom_factor = 1,
    zoom_rigid = false,
    zoom_disable_aa = true,
    hotspot_padding = 1
  },

  xwayland = {
    force_zero_scaling = true
  }
})
