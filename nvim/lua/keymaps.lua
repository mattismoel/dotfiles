local term_opts = { silent = true }

local keymap = require("keymap")

keymap.keymap("n", "<leader>w", ":update<CR>", { desc = "Write file" }) -- Save file
keymap.keymap("i", "kk", "<Esc>", { desc = "Go to normal mode" })
keymap.keymap("n", "zz", ":qa<CR>", { desc = "Quit Neovim" })

-- LSP --
-- Diagnostics
keymap.keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "Toggle diagnostics" }) -- Open floating diagnostics window
keymap.keymap("n", "[d", vim.diagnostic.goto_prev)                                          -- Go to previous diagnostic message
keymap.keymap("n", "]d", vim.diagnostic.goto_next)                                          -- Go to next diagnostic message

-- Move lines --
keymap.keymap("i", "<A-j>", "<ESC>:m .+1<CR>==gi") -- Move line up in "insert" mode
keymap.keymap("i", "<A-k>", "<ESC>:m .-2<CR>==gi") -- Move line down in "insert" mode
keymap.keymap("n", "<A-j>", ":m .+1<CR>==")        -- Move line up in "normal" mode
keymap.keymap("n", "<A-k>", ":m .-2<CR>==")        -- Move line down in "normal" mode
keymap.keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")    -- Move lines up in "visual" mode
keymap.keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")    -- Move lines down in "visual" mode

-- Window resizing
local resize_steps = 5
keymap.keymap("n", "<A-Left>", string.format(":vertical resize +%i<CR>", resize_steps))  -- Resize window to the right
keymap.keymap("n", "<A-Right>", string.format(":vertical resize -%i<CR>", resize_steps)) -- Resize window to the left
keymap.keymap("n", "<A-Up>", string.format(":resize -%i<CR>", resize_steps))             -- Resize window up
keymap.keymap("n", "<A-Down>", string.format(":resize +%i<CR>", resize_steps))           -- Resize window down
