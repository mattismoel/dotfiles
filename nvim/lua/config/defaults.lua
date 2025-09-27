vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- vim.opt.expandtab = true

vim.opt.showmode = false
vim.opt.colorcolumn = "80"

vim.opt.wrap = false
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR>")
vim.opt.inccommand = "split"
vim.opt.cursorline = true

vim.opt.scrolloff = 10
vim.opt.confirm = true

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end
})

vim.opt.winborder = "single"
