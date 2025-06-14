return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
    { "mason-org/mason.nvim", opts = {} },
  },
  opts = {
    servers = {
      vtsls = {},
      svelte = {},
      html = {},
      lua_ls = {},
      gopls = {},
    },
  },
  config = function(_, opts)
    for server_name, server_opts in pairs(opts.servers) do
      vim.lsp.config(server_name, {
        settings = server_opts,
      })

      vim.lsp.enable(server_name)
    end
  end,

  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, {desc = "[R]e[n]ame"})
}
