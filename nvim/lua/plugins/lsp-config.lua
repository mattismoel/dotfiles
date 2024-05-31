return {
  {
    "williamboman/mason.nvim",
    opts = {},
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = { "lua_ls", "html", "bashls" },
    },
    config = function()
      require("mason-lspconfig").setup()
      local servers = {
        gopls = {},
        pyright = {},
        tsserver = {},
        html = {
          filetypes = { "html" },
          init_options = {
            provideFormatter = false,
          },
        },
        lua_ls = {},
        bashls = {},
        clangd = {},
        templ = {},
        tailwindcss = { filetypes = { "html", "tsx", "jsx", "templ", "svelte" } },
      }

      vim.filetype.add({ extension = { templ = "templ" } })
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers)
      })

      vim.filetype.add({ extension = { templ = "templ" } })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes
          })
          require("lspconfig").gdscript.setup {}
        end
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,

    keys = {
      { "K",          vim.lsp.buf.hover,        desc = "Hover documentation" },
      { "gd",         vim.lsp.buf.definition,   desc = "Go to definition" },
      { "<leader>ca", vim.lsp.buf.code_action,  desc = "Code actions" },
      -- { "<leader>fd", vim.lsp.buf.format,       desc = "Format" },
      { "]d",         vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
      { "[d",         vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
    },
  },
}
