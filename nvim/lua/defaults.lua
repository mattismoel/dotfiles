local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

opt.list = true

opt.showmode = false
opt.colorcolumn = "80"

opt.wrap = false
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)

opt.breakindent = true
opt.undofile = true

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes:1"

opt.updatetime = 250
opt.timeoutlen = 300

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR>")
opt.inccommand = "split"
opt.cursorline = true

opt.scrolloff = 10
opt.confirm = true
opt.autoindent = true

opt.hlsearch = false

opt.swapfile = false
opt.termguicolors = true

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end
})

opt.winborder = "single"

vim.cmd.filetype("plugin indent on")

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "<filetype>" },
--   callback = function() vim.treesitter.start() end,
-- })
