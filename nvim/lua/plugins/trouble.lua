return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    { "<leader>e", function() require("trouble").toggle() end, desc = "Toggle [E]rror Messages" },
  }
}
