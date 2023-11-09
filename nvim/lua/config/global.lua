local opt = vim.opt
local g = vim.g

-- GENERAL --
opt.mouse = ""
opt.clipboard:append "unnamedplus"
opt.swapfile = false
opt.completeopt = "menuone,noinsert,noselect"


--------------------------------------------------------
-- UI
--------------------------------------------------------
opt.number = true
opt.showmatch = true
-- opt.foldmarker = "marker"
opt.colorcolumn = "100"
opt.laststatus = 3


--------------------------------------------------------
-- TABS 
--------------------------------------------------------
local tabsize = 4
opt.expandtab = true
opt.shiftwidth = tabsize
opt.tabstop = tabsize
opt.breakindent = true
opt.smartindent = true
opt.autoindent = true


--------------------------------------------------------
-- MEMORY
--------------------------------------------------------
opt.hidden = true


--------------------------------------------------------
-- Search
--------------------------------------------------------
opt.ignorecase = true
opt.smartcase = true


--------------------------------------------------------
-- Window
--------------------------------------------------------
opt.splitright = true
opt.splitbelow = true


--------------------------------------------------------
-- MISC 
--------------------------------------------------------
opt.signcolumn = "yes:1"

