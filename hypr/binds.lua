local max_workspace_count = 5

local direction_to_key = { left = "H", right = "L", up = "K", down = "J" }

local terminal = "foot"
local menu = "~/.config/rofi/launcher.sh"
local browser = "zen-browser"
local file_manager = "dolphin"

local bind = hl.bind
local exec_cmd = hl.dsp.exec_cmd
local window = hl.dsp.window
local focus = hl.dsp.focus

bind("SUPER + RETURN", exec_cmd(terminal))
bind("SUPER + B", exec_cmd(browser))
bind("SUPER + SPACE", exec_cmd(menu))

bind("SUPER + SHIFT + Q", window.close())
bind("SUPER + E", exec_cmd(file_manager))

bind("XF86AudioRaiseVolume", exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
bind("XF86AudioLowerVolume", exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))
bind("XF86AudioMute", exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
bind("XF86AudioPrev", exec_cmd("playerctl previous"))
bind("XF86AudioNext", exec_cmd("playerctl next"))
bind("XF86AudioPlay", exec_cmd("playerctl play-pause"))

-- ## Backlight brightness.
bind("XF86MonBrightnessUp", exec_cmd("brightnessctl -e set +15%"))
bind("XF86MonBrightnessDown", exec_cmd("brightnessctl --min-value=100 -e set 15%-"))
bind("SUPER + SHIFT + S", exec_cmd("hyprshot -m region --clipboard-only"))

for direction, key in pairs(direction_to_key) do
  bind(string.format("SUPER + %s", key), focus({ direction = direction }))
  bind(string.format("SUPER + SHIFT + %s", key), window.move({ direction = direction }))

  bind(string.format("SUPER + CTRL + %s", key), window.resize({
    x = (direction == "right" and 100) or (direction == "left" and -100) or 0,
    y = (direction == "down" and 100) or (direction == "up" and -100) or 0,
    relative = true
  }))
end

for i = 0, max_workspace_count, 1 do
  bind(string.format("SUPER + %d", i), focus({ workspace = i }))
  bind(string.format("SUPER + SHIFT + %d", i), window.move({ workspace = i }))
end
