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
        html = { filetypes = { "html" } },
        lua_ls = {},
        bashls = {},
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers)
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes
          })
        end
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    -- config = function()
    --   local capabilities = require("cmp_nvim_lsp").default_capabilities()
    --   local lspconfig = require("lspconfig")
    --
    --   local function setup_lsp(server, config)
    --     lspconfig[server].setup(vim.tbl_extend("force", {
    --       capabilities = capabilities,
    --     }, config or {}))
    --   end
    --

    --   local servers = { "gopls", "lua_ls", "tsserver", "gdscript", "svelte", "tailwindcss" }
    --
    --   for _, server in ipairs(servers) do
    --     setup_lsp(server, {})
    --   end

    -- lspconfig.gopls.setup({
    -- capabilities
    -- })
    --
    -- lspconfig.lua_ls.setup({
    -- capabilities = capabilities,
    -- })
    --
    -- lspconfig.tsserver.setup({
    -- capabilities = capabilities,
    -- })
    --
    -- lspconfig.gdscript.setup({
    -- capabilities = capabilities
    -- })
    --
    -- lspconfig.svelte.setup({
    --        capabilities = capabilities

    -- })
    -- end,
    keys = {
      { "K",          vim.lsp.buf.hover,        desc = "Hover documentation" },
      { "gd",         vim.lsp.buf.definition,   desc = "Go to definition" },
      { "<leader>ca", vim.lsp.buf.code_action,  desc = "Code actions" },
      { "<leader>fd", vim.lsp.buf.format,       desc = "Format" },
      { "]d",         vim.diagnostic.goto_next, desc = "Go to next diagnostic" },
      { "[d",         vim.diagnostic.goto_prev, desc = "Go to previous diagnostic" },
    },
  },
}
