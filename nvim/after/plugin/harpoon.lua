-- Harpoon --
local mark = require "harpoon.mark"
local ui = require "harpoon.ui"

local keymap = require "keymap"

keymap.keymap("n", "<leader>hm", mark.add_file, { desc = "Mark file to harpoon" })
keymap.keymap("n", "<leader>hr", mark.rm_file, { desc = "Remove file from harpoon" })
keymap.keymap("n", "<leader>hp", ui.toggle_quick_menu, { desc = "Toggle harpoon UI" })
