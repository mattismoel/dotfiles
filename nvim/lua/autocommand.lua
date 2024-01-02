-- Highlight on yank --

vim.api.nvim_create_augroup("bufcheck", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = "bufcheck",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = "200" })
  end
})

-- Remove whitespace on save --
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "",
  command = ":%s/\\s\\+$//e"
})
