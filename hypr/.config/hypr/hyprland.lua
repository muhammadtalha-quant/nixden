local config_home = os.getenv("XDG_CONFIG_HOME")
    or (os.getenv("HOME") .. "/.config")

package.path = config_home .. "/hypr/?.lua;"
    .. config_home .. "/hypr/?/init.lua;"
    .. package.path

require("hyprland.animations")
require("hyprland.config")
require("hyprland.curves")
require("hyprland.events")
require("hyprland.gestures")
require("hyprland.keybindings")
require("hyprland.monitors")
require("hyprland.rules")

require("noctalia")

-- Startup
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
end)

