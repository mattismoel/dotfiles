vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
  format_on_save = {
    timeout_ms = 5000,
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    javascript = { "prettier", stop_after_first = true },
    svelte = { "prettier", stop_after_first = true },
    typescriptreact = { "prettier", stop_after_first = true }
  },
})
