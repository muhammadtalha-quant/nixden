local KEYS = require("lib.keys")
local helpers = require("lib.helpers")


for i = 1, 9 do
  helpers.focus_ws(i)
  helpers.move_window_to_and_focus_ws(i)
  helpers.move_window_to_ws(i)
end

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.MODIFIER.ALT,
    KEYS.ARROW.RIGHT
  ),
  hl.dsp.focus({
    workspace = "+1"
  }),
  {
    description = "Switch to workspace right"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.MODIFIER.ALT,
    KEYS.ARROW.LEFT
  ),
  hl.dsp.focus({
    workspace = "-1"
  }),
  {
    description = "Switch to workspace left"
  }
)


hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.MODIFIER.ALT,
    KEYS.ALPHABET.S
  ),
  hl.dsp.window.move(
    {
      workspace = "special:scratchpad",
      follow = false
    }
  ),
  {
    description = "Move Window (Silent) to Scratchpad"
  }
)


hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.MODIFIER.SHIFT,
    KEYS.ALPHABET.S
  ),
  hl.dsp.window.move(
    {
      workspace = "special:scratchpad",
    }
  ),
  {
    description = "Move Window to Scratchpad"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.ALPHABET.S
  ),
  hl.dsp.workspace.toggle_special("scratchpad"),
  {
    description = "Toggle Scratchpad"
  }
)
