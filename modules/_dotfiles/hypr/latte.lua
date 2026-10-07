local primary = "rgb(8839ef)"
local surface = "rgb(eff1f5)"
local on_surface = "rgb(4c4f69)"
local secondary = "rgb(7287fd)"
local on_secondary = "rgb(eff1f5)"
local error = "rgb(d20f39)"
local on_error = "rgb(eff1f5)"

local function apply_theme()
  hl.config({
    general = {
      col = {
        active_border = primary,
        inactive_border = surface,
      },
    },
    group = {
      col = {
        border_active = secondary,
        border_inactive = surface,
        border_locked_active = error,
        border_locked_inactive = surface,
      },

      groupbar = {
        col = {
          active = secondary,
          inactive = surface,
          locked_active = error,
          locked_inactive = surface,
        },
        text_color = on_secondary,
        text_color_inactive = on_surface,
        text_color_locked_active = on_error,
        text_color_locked_inactive = on_surface,
      },
    },
  })
end

return {
  colors = {
    primary = primary,
    surface = surface,
    on_surface = on_surface,
    secondary = secondary,
    on_secondary = on_secondary,
    error = error,
    on_error = on_error,
  },
  apply_theme = apply_theme
}
