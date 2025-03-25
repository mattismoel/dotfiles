vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Hide search highlights on ESC.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
