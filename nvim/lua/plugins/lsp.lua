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
			yamlls = {},
			emmet_language_server = {},
			zls = {},
			tailwindcss = {},
			rust_analyzer = {},
			clangd = {},
			jsonls = {},
			cssls = {},
			cssmodules_ls = {},
			gdscript = {
				-- name = "godot",
				-- cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
			},
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
