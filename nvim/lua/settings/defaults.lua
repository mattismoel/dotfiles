-- || GENERAL DEFAULTS || --
-- Sync vim clipboard with system.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.g.have_nerd_font = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true

-- || LINE NUMBERING || --
vim.opt.number = true
vim.opt.relativenumber = true

-- || MOUSE || --
-- Disable the mouse.
vim.opt.mouse = ""

-- Hide the vim mode, as it is visible in the status line.
vim.opt.showmode = false

-- || FORMATTING || --
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- || SEARCH || --
-- Ignore case on search.
vim.opt.ignorecase = true
vim.opt.smartcase = true
