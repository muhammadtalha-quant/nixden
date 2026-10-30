local KEYS = require("lib.keys")
local helpers = require("lib.helpers")

local apps = {
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.SPECIAL.ENTER)]         =
  {
    cmd = "kitty",
    desc = "Open Kitty Terminal"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.B)]            =
  {
    cmd = "google-chrome",
    desc = "Open Google Chrome Browser"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.E)]            =
  {
    cmd = "nautilus",
    desc = "Open File Manager"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.PUNCTUATION.SEMICOLON)] =
  {
    cmd = "localsend_app",
    desc = "Open Localsend"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.C)]            =
  {
    cmd = "kitty nvim",
    desc = "Open Neovim"
  },
  [helpers.register(KEYS.MODIFIER.SUPER, KEYS.ALPHABET.N)]            =
  {
    cmd = "obsidian",
    desc = "Open Obsidian"
  }
}

local websites = {
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.W)] = {
    cmd = helpers.url_in_chrome("https://web.whatsapp.com"),
    desc = "Open Whatsapp"
  },
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.O)] = {
    cmd = helpers.url_in_chrome("https://docs.google.com/document/u/0/"),
    desc = "Open Google Office Suite"
  },
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.D)] = {
    cmd = helpers.url_in_chrome("https://discord.com/channels/@me"),
    desc = "Open Discord"
  },
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.G)] = {
    cmd = helpers.url_in_chrome("https://github.com/muhammadtalha-quant"),
    desc = "Open GitHub (My Account)"
  },
  [helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.M)] = {
    cmd = helpers.url_in_chrome("https://mail.google.com/mail/u/0/#inbox"),
    desc = "Open GMail Inbox"
  },
}


hl.bind(
  helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.S),
  hl.dsp.submap("socialmedia"),
  {
    description = "Launch Social Media ([y]outube, [f]acebook, [r]eddit, [i]nstagram and [t]iktok)",
  }
)

hl.bind(
  helpers.register(KEYS.MODIFIER.ALT, KEYS.ALPHABET.A),
  hl.dsp.submap("ai_mode"),
  {
    description = "Launch AI (chatgp[t], [c]laude, [g]emini | [n]otebook and [q]wen)",
  }
)

for keybind, app in pairs(apps) do
  hl.bind(
    keybind,
    hl.dsp.exec_cmd(app.cmd),
    {
      description = app.desc,
    }
  )
end


for keybind, site in pairs(websites) do
  hl.bind(
    keybind,
    hl.dsp.exec_cmd(site.cmd),
    {
      description = site.desc,
    }
  )
end
