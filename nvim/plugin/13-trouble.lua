vim.pack.add({ "https://github.com/folke/trouble.nvim" })

require("trouble").setup()

local wk = require("which-key")

wk.add({
  {
    "<leader>xx",
    "<CMD>Trouble diagnostics toggle<CR>",
    desc = "Diagnostics (Trouble)"
  },

  {
    "<leader>xX",
    "<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
    desc = "Buffer Diagnostics (Trouble)"
  }
})
