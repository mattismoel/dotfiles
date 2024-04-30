return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit"
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>lg", "<CMD>LazyGit<CR>", desc = "Open [L]azy[G]it" },
  },
}
