local builtin = require("telescope.builtin")
local keymap = require "keymap"

keymap.keymap("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
keymap.keymap("n", "<leader>fg", builtin.live_grep, { desc = "Grep files" })
keymap.keymap("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
