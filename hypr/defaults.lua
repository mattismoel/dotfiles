---@type string Which terminal emulator to use.
local terminal = "foot"

---@type string Which default browser to use.
local browser = "zen-browser"

---@type string Which file manager to use.
local file_manager = "dolphin"

local menu = "~/.config/rofi/launcher.sh"

return {
  terminal = terminal,
  browser = browser,
  file_manager = file_manager,
  menu = menu
}
