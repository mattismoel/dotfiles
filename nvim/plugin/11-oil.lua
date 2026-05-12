vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup()

local wk = require("which-key")

wk.add({
  { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
})
