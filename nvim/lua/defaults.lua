vim.o.hlsearch = false                 -- Highlight on search
vim.wo.number = true                   -- Enable line numbering
vim.o.mouse = ""                       -- Disable mouse
vim.o.clipboard = "unnamedplus"        -- Clipboard
vim.o.breakindent = true               -- Break indentation
vim.o.undofile = true                  -- Track undo
vim.o.ignorecase = true                -- Ignore case when searching command
vim.o.smartcase = true                 -- Smart case
vim.wo.signcolumn = "yes"              -- Enable column for signs (debugging signs, git signs etc.)
vim.o.updatetime = 250
vim.o.timeoutlen = 300                 -- Maximum duration for waiting for a key sequence
vim.o.completeopt = "menuone,noselect" -- The type of window for completions
vim.o.termguicolors = true             -- Enable terminal colors
vim.opt.laststatus = 3                 -- Disable status line for irrelevant windows
vim.g.loaded_netrw = 1                 -- Disable NetRW
vim.g.loaded_netrwPlugin = 1           -- Disable NetRW plugin

-- TABS AND INDENTATION
vim.o.tabstop = 4      -- Set tabsize
vim.o.shiftwidth = 4   -- Set shift width
vim.o.expandtab = true -- Use spaces instead of tabs
