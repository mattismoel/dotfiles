vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.keymap.set

keymap("n", "<leader>w", ":update<CR>", opts) -- Save file
keymap("i", "kk", "<Esc>", opts)
keymap("n", "zz", ":qa<CR>", opts)
keymap("n", "<leader>e", ":Neotree toggle<CR>", opts) -- Toggle Oil explorer


-- LSP --
-- Diagnostics

keymap("n", "<leader>d", vim.diagnostic.open_float, opts) -- Open floating diagnostics window
keymap("n", "[d", vim.diagnostic.goto_prev, opts)         -- Go to previous diagnostic message
keymap("n", "]d", vim.diagnostic.goto_next, opts)         -- Go to next diagnostic message
