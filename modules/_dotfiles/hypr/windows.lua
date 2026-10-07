local KEYS = require("lib.keys")
local helpers = require("lib.helpers")

hl.bind(helpers.register(
    KEYS.MODIFIER.ALT,
    KEYS.ALPHABET.R
  ),
  hl.dsp.submap("resize"),
  {
    description = "Resize Windows/Tiles",
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.ALPHABET.Q
  ),
  hl.dsp.window.close(),
  {
    description = "Gracefully Close Window"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.MODIFIER.SHIFT,
    KEYS.ALPHABET.Q
  ),
  hl.dsp.window.kill(),
  {
    description = "Forcefully Close Window"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.ALPHABET.T
  ),
  hl.dsp.window.float(),
  {
    description = "Toggle [Un]float"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.ALPHABET.P
  ),
  hl.dsp.window.pin(),
  {
    description = "Toggle [Un]pin Floating Windows"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.ARROW.LEFT
  ),
  hl.dsp.focus({
    direction = "left"
  }),
  {
    description = "Focus Window Left"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.ARROW.RIGHT
  ),
  hl.dsp.focus({
    direction = "right"
  }),
  {
    description = "Focus Window Right"
  }
)
hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.ARROW.UP
  ),
  hl.dsp.focus({
    direction = "up"
  }),
  {
    description = "Focus Window Up"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.ARROW.DOWN
  ),
  hl.dsp.focus({
    direction = "down"
  }),
  {
    description = "Focus Window Down"
  }
)


hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.ALPHABET.F
  ),
  hl.dsp.window.fullscreen(
    {
      mode = "maximized",
      action = "toggle"
    }
  ),
  {
    description = "Window: Maximize"
  }
)


hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.MODIFIER.SHIFT,
    KEYS.ALPHABET.F
  ),
  hl.dsp.window.fullscreen(),
  {

    description = "Toggle Fullscreen"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.MOUSE.LMB
  ),
  hl.dsp.window.drag(),
  {
    description = "Drag Window"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.MOUSE.RMB
  ),
  hl.dsp.window.resize(),
  {
    description = "Resize Window"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.MODIFIER.SHIFT,
    KEYS.ARROW.LEFT
  ),
  hl.dsp.window.swap({
    direction = "left"
  }),
  {
    description = "Swap Focused Window with Window to Left"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.MODIFIER.SHIFT,
    KEYS.ARROW.RIGHT
  ),
  hl.dsp.window.swap({
    direction = "right"
  }),
  {
    description = "Swap Focused Window with Window to Right"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.MODIFIER.SHIFT,
    KEYS.ARROW.UP
  ),
  hl.dsp.window.swap({
    direction = "up"
  }),
  {
    description = "Swap Focused Window with Window Above"
  }
)

hl.bind(
  helpers.register(
    KEYS.MODIFIER.SUPER,
    KEYS.MODIFIER.SHIFT,
    KEYS.ARROW.DOWN
  ),
  hl.dsp.window.swap({
    direction = "down"
  }),
  {
    description = "Swap Focused Window with Window Below"
  }
)
