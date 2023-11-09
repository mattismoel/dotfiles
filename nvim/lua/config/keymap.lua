-- Set map leader --
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Define map function for ease of use
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- GENERAL --
map("i", "kk", "<Esc>")                                                             -- Remap ESC key for ease of use
map("i", "KK", "<Esc>")

map("n", "<leader>e", ":NvimTreeToggle<CR>")                                        -- Toggle file tree
map("n", "<leader>w", ":w<CR>", { silent = false })                                 -- Save file
map("n", "<leader>qq", ":qa!<CR>")                                                  -- Quit neovim
map("n", "<leader>fd", ":Format<CR>")                                               -- Format document


-- MOVE LINES --
map("n", "<A-j>", ":m .+1<CR>==")                                                   -- Move line up in NORMAL mode
map("n", "<A-k>", ":m .-2<CR>==")                                                   -- Move line down in NORMAL mode
map("v", "<A-j>", ":m '>+1<CR>gv=gv")                                               -- Move lines up in VISUAL mode
map("v", "<A-k>", ":m '<-2<CR>gv=gv")                                               -- Move lines down in VISUAL mode


-- RESIZE WINDOW --
local resize_steps = 5
map("n", "<A-Left>", string.format(":vertical resize +%i<CR>", resize_steps))       -- Resize window vertically
map("n","<A-Right>", string.format(":vertical resize -%i<CR>", resize_steps))       -- Resize window vertically
map("n","<A-Up>", string.format(":resize -%i<CR>", resize_steps))                   -- Resize window vertically
map("n","<A-Down>", string.format(":resize -%i<CR>", resize_steps))                 -- Resize window vertically


-- LAZYGIT --
map("n", "<leader>lg", ":LazyGit<CR>")
