local KEYS = require("lib.keys")
local M = {}
local active_animation_profile

local DWINDLE_ANIMATIONS = {
  windowsIn = { speed = 3, bezier = "emphasizedDecel", style = "popin 80%" },
  windowsOut = { speed = 2, bezier = "emphasizedDecel", style = "popin 90%" },
  windowsMove = { speed = 3, bezier = "emphasizedDecel", style = "slide" },
  layersIn = { speed = 2.7, bezier = "emphasizedDecel", style = "popin 93%" },
  layersOut = { speed = 2.4, bezier = "menu_accel", style = "popin 94%" },
  workspaces = { speed = 7, bezier = "menu_decel", style = "slide" },
  specialWorkspaceIn = { speed = 2.8, bezier = "emphasizedDecel", style = "slidevert" },
  specialWorkspaceOut = { speed = 1.2, bezier = "emphasizedAccel", style = "slidevert" }
}

local SCROLLING_ANIMATIONS = {
  windowsIn = { speed = 5, bezier = "expressiveDefaultSpatial", style = "slide" },
  windowsOut = { speed = 4, bezier = "emphasizedAccel", style = "slide" },
  windowsMove = { speed = 5.5, bezier = "expressiveDefaultSpatial", style = "slide" },
  layersIn = { speed = 4, bezier = "emphasizedDecel", style = "slide" },
  layersOut = { speed = 3.5, bezier = "emphasizedAccel", style = "slide" },
  workspaces = { speed = 6.5, bezier = "menu_decel", style = "slidevert" },
  specialWorkspaceIn = { speed = 4.5, bezier = "emphasizedDecel", style = "slidefadevert -100%" },
  specialWorkspaceOut = { speed = 3.5, bezier = "emphasizedAccel", style = "slidefadevert -100%" }
}

local function apply_animation(leaf, spec)
  hl.animation({
    leaf = leaf,
    enabled = true,
    speed = spec.speed,
    bezier = spec.bezier,
    style = spec.style
  })
end

function M.register(...)
  return table.concat({ ... }, "+")
end

function M.active_workspace()
  local workspace = hl.get_active_workspace()
  if not workspace then
    error("No active workspace is available")
  end
  return workspace
end

function M.active_layout()
  return hl.get_config("general:layout")
end

function M.is_scrolling_active()
  return M.active_layout() == "scrolling"
end

function M.apply_animation_profile(layout_override)
  local layout = layout_override or hl.get_config("general:layout")
  local is_scrolling = layout == "scrolling"
  local profile = is_scrolling and "scrolling" or "dwindle"

  if profile == active_animation_profile then
    return
  end

  local anim_profile = is_scrolling and SCROLLING_ANIMATIONS or DWINDLE_ANIMATIONS
  for leaf, spec in pairs(anim_profile) do
    apply_animation(leaf, spec)
  end
  active_animation_profile = profile
end

function M.toggle_global_layout()
  local current = hl.get_config("general:layout")
  local target

  if current == "dwindle" then
    target = "scrolling"
  elseif current == "scrolling" then
    target = "dwindle"
  else
    error("Cannot toggle unsupported global layout: " .. tostring(current))
  end

  M.apply_animation_profile(target)
  hl.config({
    general = {
      layout = target
    }
  })
end

function M.layout_action(scrolling_action, fallback_dispatcher)
  return function()
    if M.is_scrolling_active() then
      hl.dispatch(hl.dsp.layout(scrolling_action))
    else
      hl.dispatch(fallback_dispatcher())
    end
  end
end

function M.focus_ws(workspace_id)
  hl.bind(
    M.register(
      KEYS.MODIFIER.SUPER,
      tostring(workspace_id)
    ),
    hl.dsp.focus({
      workspace = tostring(workspace_id)
    }),
    {
      description = "Switch To Workspace # " .. tostring(workspace_id)
    }
  )
end

function M.move_window_to_and_focus_ws(workspace_id)
  hl.bind(
    M.register(
      KEYS.MODIFIER.SUPER,
      KEYS.MODIFIER.SHIFT,
      tostring(workspace_id)
    ),
    hl.dsp.window.move({
      workspace = tostring(workspace_id)
    }),
    {
      description = "Move Window To Workspace # " .. tostring(workspace_id)
    }
  )
end

function M.move_window_to_ws(workspace_id)
  hl.bind(
    M.register(
      KEYS.MODIFIER.SUPER,
      KEYS.MODIFIER.ALT,
      tostring(workspace_id)
    ),
    hl.dsp.window.move({
      workspace = tostring(workspace_id),
      follow = false,
    }),
    {
      description = "Move Window (Silent) To Workspace # " .. tostring(workspace_id)
    }
  )
end

function M.url_in_chrome(url)
  return "google-chrome " .. url
end

return M
