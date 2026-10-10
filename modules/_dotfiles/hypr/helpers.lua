local KEYS = require("lib.keys")
local M = {}
local workspace_layout_rules = {}
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
  windowsIn = { speed = 3, bezier = "expressiveDefaultSpatial", style = "slide" },
  windowsOut = { speed = 2.5, bezier = "emphasizedAccel", style = "slide" },
  windowsMove = { speed = 3, bezier = "expressiveDefaultSpatial", style = "slide" },
  layersIn = { speed = 2.7, bezier = "emphasizedDecel", style = "slide" },
  layersOut = { speed = 2.4, bezier = "emphasizedAccel", style = "slide" },
  workspaces = { speed = 7, bezier = "menu_decel", style = "slidevert" },
  specialWorkspaceIn = { speed = 2.8, bezier = "emphasizedDecel", style = "slidevert" },
  specialWorkspaceOut = { speed = 2.8, bezier = "emphasizedAccel", style = "slidevert" }
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
  local workspace = hl.get_active_workspace()
  return workspace and workspace.tiled_layout or nil
end

function M.is_scrolling_active()
  return M.active_layout() == "scrolling"
end

function M.apply_animation_profile(global_layout_override, workspace_layout_override)
  local global_layout = global_layout_override or hl.get_config("general:layout")
  local workspace = hl.get_active_workspace()
  local global_scrolling = global_layout == "scrolling"
  local workspace_layout = workspace_layout_override or (workspace and workspace.tiled_layout)
  local workspace_scrolling = workspace_layout == "scrolling"
  local profile = (global_scrolling and "global-scrolling" or "global-dwindle")
    .. (workspace_scrolling and "-workspace-scrolling" or "-workspace-dwindle")

  if profile == active_animation_profile then
    return
  end

  local window_profile = workspace_scrolling and SCROLLING_ANIMATIONS or DWINDLE_ANIMATIONS
  local workspace_profile = global_scrolling and SCROLLING_ANIMATIONS or DWINDLE_ANIMATIONS
  for leaf, spec in pairs(window_profile) do
    if leaf ~= "workspaces" and leaf ~= "specialWorkspaceIn" and leaf ~= "specialWorkspaceOut" then
      apply_animation(leaf, spec)
    end
  end
  apply_animation("workspaces", workspace_profile.workspaces)
  apply_animation("specialWorkspaceIn", workspace_profile.specialWorkspaceIn)
  apply_animation("specialWorkspaceOut", workspace_profile.specialWorkspaceOut)
  active_animation_profile = profile
end

local function get_workspace_layout_rules(workspace)
  local address = workspace.addressable_name
  local rules = workspace_layout_rules[address]
  if rules then
    return rules
  end

  rules = {
    dwindle = hl.workspace_rule({
      workspace = address,
      layout = "dwindle",
      enabled = false
    }),
    scrolling = hl.workspace_rule({
      workspace = address,
      layout = "scrolling",
      enabled = false
    })
  }
  if not rules.dwindle or not rules.scrolling then
    error("Failed to create workspace layout rules for " .. address)
  end

  workspace_layout_rules[address] = rules
  return rules
end

function M.toggle_workspace_layout()
  local workspace = M.active_workspace()
  local current = workspace.tiled_layout
  local target

  if current == "dwindle" then
    target = "scrolling"
  elseif current == "scrolling" then
    target = "dwindle"
  else
    error("Cannot toggle unsupported workspace layout: " .. tostring(current))
  end

  local rules = get_workspace_layout_rules(workspace)
  M.apply_animation_profile(nil, target)
  rules[target]:set_enabled(true)
  rules[current]:set_enabled(false)
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

  for _, rules in pairs(workspace_layout_rules) do
    rules.dwindle:set_enabled(false)
    rules.scrolling:set_enabled(false)
  end

  M.apply_animation_profile(target, target)
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
