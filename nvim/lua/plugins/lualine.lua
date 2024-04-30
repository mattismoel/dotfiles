return {
  "nvim-lualine/lualine.nvim",
  opts = {
    theme = "dracula",
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff" },
      lualine_c = { "diagnostics", "filename" }
    }
  }
}
