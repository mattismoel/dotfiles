return {
  {
    "williamboman/mason.nvim",
    opts = {},
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls" },
    },
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.gopls.setup({
        capabilities
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.gdscript.setup({
        capabilities = capabilities
      })

    end,
    keys = {
      { "K",          vim.lsp.buf.hover,       desc = "Hover documentation" },
      { "gd",         vim.lsp.buf.definition,  desc = "Go to definition" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code actions" },
      { "<leader>fd", vim.lsp.buf.format,      desc = "Format" },
      { "]d", vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
      { "[d", vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
    },
  },
}
