return {
  "lervag/vimtex",
  init = function()
    -- vim.g.vimtex_quickfix_enabled = 0
    -- vim.g.vimtex_view_general_viewer = "okular"
    -- vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
    vim.g.vimtex_compiler_method = "latexmk"
  end,
  ft = { "tex" },
}
