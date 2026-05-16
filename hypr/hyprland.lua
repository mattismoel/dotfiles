require("binds")
require("autostart")
local util = require("util")

---Modules that are optionally loaded per device specific configuration.
local optional_modules = { "nvidia", "display" }

--- The commands to run when hyprland loads.
---@type string[]
local autostart_cmds = {
  "waybar",
  "hyprpaper",
  "dunst",
  "docker context use default",
}

-- Load optional modules.
for _, module in ipairs(optional_modules) do
  if util.is_module_available(module) then require(module) end
end

-- AUTOSTART --
hl.on("hyprland.start", function()
  local cmd = util.create_concat_cmd(autostart_cmds)
  hl.exec_cmd(cmd)
end)

-- ANIMATION CURVES --
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 }, } })

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "myBezier" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- MAIN CONFIGURATION --
hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "altgr-intl",
    kb_options = "caps:escape"
  },
  general = {
    allow_tearing = false,
    layout = "dwindle",
    gaps_out = 8,
    col = {
      active_border = "#ffffff66"
    }
  },
  decoration = {
    rounding = 5,
    dim_inactive = true,
    dim_strength = 0.15,

    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      noise = 0.15,

      vibrancy = 0.4,
    },
  },
  animations = {
    enabled = true,
  },
  dwindle = {
    preserve_split = true,
    force_split = 2,
  },
  master = {
    new_status = "master",
  },
  misc = {
    animate_manual_resizes = true,
  },
})
