local KEYS = require("lib.keys")
local M = {}

function M.register(...)
  return table.concat({ ... }, "+")
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
