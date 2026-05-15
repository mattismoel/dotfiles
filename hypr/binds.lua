local defaults = require("defaults")

---@alias direction "left" | "right" | "up" | "down"

local exec_cmd = hl.dsp.exec_cmd
local window = hl.dsp.window
local focus = hl.dsp.focus

---@param keys string[] Keys to use for compound bind.
---@param cmd any
local bind = function(keys, cmd)
  local key_str = table.concat(keys, " + ")
  hl.bind(key_str, cmd)
end

---@type integer The maximum allowed workspace count.
local max_workspace_count = 5

---@type table<direction, string>
local direction_to_key = { left = "H", right = "L", up = "K", down = "J" }


--- PROGRAM BINDS ---
bind({ "SUPER", "RETURN" }, exec_cmd(defaults.terminal))
bind({ "SUPER", "B", }, exec_cmd(defaults.browser))
bind({ "SUPER", "SPACE" }, exec_cmd(defaults.menu))
bind({ "SUPER", "E" }, exec_cmd(defaults.file_manager))

--- FUNCTION BINDS ---
bind({ "XF86MonBrightnessUp" }, exec_cmd("brightnessctl -e set +15%"))
bind({ "XF86MonBrightnessDown" }, exec_cmd("brightnessctl --min-value=100 -e set 15%-"))
bind({ "SUPER", "SHIFT", "S" }, exec_cmd("hyprshot -m region --clipboard-only"))

bind({ "XF86AudioRaiseVolume" }, exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
bind({ "XF86AudioLowerVolume" }, exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
bind({ "XF86AudioMute" }, exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
bind({ "XF86AudioPrev" }, exec_cmd("playerctl previous"))
bind({ "XF86AudioNext" }, exec_cmd("playerctl next"))
bind({ "XF86AudioPlay" }, exec_cmd("playerctl play-pause"))


--- WINDOW BINDS ---
bind({ "SUPER", "SHIFT", "Q" }, window.close())

for direction, key in pairs(direction_to_key) do
  bind({ "SUPER", key }, focus({ direction = direction }))
  bind({ "SUPER", "SHIFT", key }, window.move({ direction = direction }))

  bind({ "SUPER", "CTRL", key }, window.resize({
    x = (direction == "right" and 100) or (direction == "left" and -100) or 0,
    y = (direction == "down" and 100) or (direction == "up" and -100) or 0,
    relative = true
  }))
end

for i = 0, max_workspace_count, 1 do
  bind({ "SUPER", tostring(i) }, focus({ workspace = i }))
  bind({ "SUPER", "SHIFT", tostring(i) }, window.move({ workspace = i }))
end
