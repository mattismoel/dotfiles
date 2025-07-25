vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Hide search highlights on ESC.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-k>", "<CMD>resize +5<CR>", { desc = "Increse window up" })
vim.keymap.set("n", "<C-j>", "<CMD>resize -5<CR>", { desc = "Increse window down" })

vim.keymap.set("n", "<C-h>", "<CMD>vertical resize +5<CR>", { desc = "Increse window left" })
vim.keymap.set("n", "<C-l>", "<CMD>vertical resize -5<CR>", { desc = "Increse window right" })
