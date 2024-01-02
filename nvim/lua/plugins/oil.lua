return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    columns = { "icon", "size", },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Oil file explorer" },
  },
  lazy = false,
}
