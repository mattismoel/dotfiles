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

vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", { desc = "Show LSP Info" })


local function restartLsps()
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  for _, client in ipairs(clients) do
    client:stop()
  end

  vim.cmd.update()
  vim.defer_fn(vim.cmd.edit, 1000)
end

vim.api.nvim_create_user_command("LspRestart", restartLsps, { desc = "Restart LSP clients" })

vim.api.nvim_create_user_command("PackUpdate", function() vim.pack.update() end, { desc = "Update packages" })

opt.winborder = "single"

vim.cmd.filetype("plugin indent on")

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "<filetype>" },
--   callback = function() vim.treesitter.start() end,
-- })
