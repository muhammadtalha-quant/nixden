local KEYS = require("lib.keys")
local helpers = require("lib.helpers")

hl.define_submap("ai_mode", function()
  local clankers = {
    [KEYS.ALPHABET.T] = helpers.url_in_chrome("https://chatgpt.com"),
    [KEYS.ALPHABET.C] = helpers.url_in_chrome("https://claude.ai"),
    [KEYS.ALPHABET.G] = helpers.url_in_chrome("https://gemini.google.com"),
    [KEYS.ALPHABET.N] = helpers.url_in_chrome("https://notebook.google.com"),
    [KEYS.ALPHABET.Q] = helpers.url_in_chrome("https://chat.qwen.ai")
  }
  for bind, clanker in pairs(clankers) do
    hl.bind(
      bind,
      function()
        hl.dispatch(hl.dsp.exec_cmd(clanker))
        hl.dispatch(hl.dsp.submap("reset"))
      end
    )
  end
end)

hl.define_submap("socialmedia", function()
  local timekillers = {
    [KEYS.ALPHABET.Y] = helpers.url_in_chrome("https://www.youtube.com/"),
    [KEYS.ALPHABET.R] = helpers.url_in_chrome("https://www.reddit.com/"),
    [KEYS.ALPHABET.F] = helpers.url_in_chrome("https://www.facebook.com/"),
    [KEYS.ALPHABET.I] = helpers.url_in_chrome("https://www.instagram.com/"),
    [KEYS.ALPHABET.T] = helpers.url_in_chrome("https://www.tiktok.com/"),
  }
  for bind, timekiller in pairs(timekillers) do
    hl.bind(
      bind,
      function()
        hl.dispatch(hl.dsp.exec_cmd(timekiller))
        hl.dispatch(hl.dsp.submap("reset"))
      end
    )
  end
end)

hl.define_submap("resize", function()
  local keyresize_spec = {
    [KEYS.ARROW.LEFT]  = { x = -10, y = 0, relative = true },
    [KEYS.ARROW.RIGHT] = { x = 10, y = 0, relative = true },
    [KEYS.ARROW.UP]    = { x = 0, y = -10, relative = true },
    [KEYS.ARROW.DOWN]  = { x = 0, y = 10, relative = true },
  }
  for bind, resize_spec in pairs(keyresize_spec) do
    hl.bind(
      bind,
      hl.dsp.window.resize(resize_spec),
      {
        repeating = true
      }
    )
  end

  hl.bind(KEYS.SPECIAL.ESCAPE, hl.dsp.submap("reset"))
  hl.bind(KEYS.SPECIAL.ENTER, hl.dsp.submap("reset"))
end)
