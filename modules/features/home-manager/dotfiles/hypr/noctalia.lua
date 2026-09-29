local KEYS = require("lib.keys")
local helpers = require("lib.helpers")

local non_repeating_ipc_calls = {
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.SPACE)] = { cmd = "noctalia msg panel-toggle launcher", desc = "Toggle App Launcher" },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.PERIOD)] = { cmd = "noctalia msg settings-toggle", desc = "Toggle Noctalia Settings" },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.V)] = { cmd = "noctalia msg panel-toggle clipboard", desc = "Toggle Clipboard History" },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.COMMA)] = { cmd = "noctalia msg panel-toggle launcher /e", desc = "Toggle Emoji Selector" },
  [KEYS.XF86.AUDIOMUTE] = { cmd = "noctalia msg volume-mute", desc = "Toggle Audio Mute" },
  [KEYS.XF86.AUDIOPLAY] = { cmd = "noctalia msg media toggle", desc = "Toggle Audio Play/Pause" },
  [KEYS.SPECIAL.PRINT] = { cmd = "noctalia msg screenshot-region", desc = "Screenshot Region" },
  [helpers.register(KEYS.MODIFIER.SHIFT, KEYS.SPECIAL.PRINT)] = { cmd = "noctalia msg screenshot-fullscreen", desc = "Screenshot Fullscreen" },
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.SPECIAL.PRINT)] = { cmd = "noctalia msg plugin noctalia/screen_recorder:service all toggle", desc = "Toggle Screen Record" },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.ALT, KEYS.ALPHABET.N)] = { cmd = "noctalia msg panel-toggle noctalia/notes:panel", desc = "Toggle Quick Notes" },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.MODIFIER.SHIFT, KEYS.PUNCTUATION.COMMA)] = { cmd = "noctalia msg panel-toggle launcher /kao", desc = "Toggle Emoticon Selector" },
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.SPECIAL.TAB)] = { cmd = "noctalia msg window-switcher", desc = "Toggle Window Switcher" },
  [helpers.register(KEYS.MODIFIER.CTRL, KEYS.MODIFIER.ALT, KEYS.NAVIGATION.DELETE)] = { cmd = "noctalia msg panel-toggle session", desc = "Toggle Session Menu" },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.L)] = { cmd = "noctalia msg session lock", desc = "Lock Session" },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.W)] = { cmd = "noctalia msg wallpaper-random", desc = "Activate Random Wallpaper" },
}

local repeating_ipc_calls = {
  [KEYS.XF86.AUDIORAISEVOLUME] = { cmd = "noctalia msg volume-up", desc = "Increase Volume By 5%" },
  [KEYS.XF86.AUDIOLOWERVOLUME] = { cmd = "noctalia msg volume-down", desc = "Decrease Volume By 5%" },
  [KEYS.XF86.BRIGHTNESSUP] = { cmd = "noctalia msg brightness-up", desc = "Increase Brightness By 5%" },
  [KEYS.XF86.BRIGHTNESSDOWN] = { cmd = "noctalia msg brightness-down", desc = "Decrease Brightness By 5%" },

}


for keybind, ipc_call in pairs(non_repeating_ipc_calls) do
  hl.bind(
    keybind,
    hl.dsp.exec_cmd(ipc_call.cmd),
    {
      description = ipc_call.desc,
    }
  )
end


for keybind, ipc_call in pairs(repeating_ipc_calls) do
  hl.bind(
    keybind,
    hl.dsp.exec_cmd(ipc_call.cmd),
    {
      description = ipc_call.desc,
      repeating = true
    }
  )
end
