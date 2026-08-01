---@type string Which terminal emulator to use.
local terminal = "foot"

---@type string Which default browser to use.
local browser = "zen-browser"

---@type string Which file manager to use.
local file_manager = "nautilus"

local menu = "~/.config/rofi/launcher.sh"

local emoji_picker = "rofi -modi emoji -show emoji"

return {
  terminal = terminal,
  browser = browser,
  file_manager = file_manager,
  menu = menu,
  emoji_picker = emoji_picker
}
