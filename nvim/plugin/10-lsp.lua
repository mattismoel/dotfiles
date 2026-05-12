vim.pack.add({
  {
    src = "https://github.com/neovim/nvim-lspconfig",
    name = "lspconfig",
  }
})

local servers = {
  vtsls = {},
  svelte = {},
  html = {},
  lua_ls = {},
  gopls = {},
  yamlls = {},
  emmet_language_server = {},
  zls = {},
  tailwindcss = {
    tailwindCSS = {
      colorDecorators = false,
      classFunctions = { "tw", "clsx", "cn" }
    }
  },
  rust_analyzer = {},
  clangd = {},
  jsonls = {},
  cssls = {},
  cssmodules_ls = {},
  gdscript = {
    -- name = "godot",
    -- cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
  },
}

for server_name, server_opts in pairs(servers) do
  vim.lsp.config(server_name, {
    settings = server_opts,
  })

  vim.lsp.enable(server_name)
end

local wk = require("which-key")

vim.diagnostic.config({ virtual_text = true })

wk.add({
  { "<leader>rn", function() vim.lsp.buf.rename() end, desc = "[R]e[n]ame" }
})
