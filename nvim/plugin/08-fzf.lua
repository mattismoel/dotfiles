vim.pack.add({ "https://github.com/nvim-mini/mini.pick" })
-- vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

require("mini.pick").setup()

-- require("fzf-lua").setup()

local wk = require("which-key")

wk.add({
  { "<leader>sf", function() MiniPick.builtin.files() end,              desc = "[S]earch [F]iles" },
  { "<leader>sb", function() MiniPick.builtin.buffers() end,            desc = "[S]earch [B]uffers" },
  { "<leader>sg", function() MiniPick.builtin.grep_live() end,          desc = "[S]earch [B]uffers" },

  -- { "<leader>sd", function() require("fzf-lua").diagnostics_workspace() end, desc = "[S]earch [D]iagnostics (Workspace)" },
  -- { "<leader>sD", function() require("fzf-lua").diagnostics_document() end,  desc = "[S]earch [D]iagnostics (Document)" },

  { "<leader>ca", function() require("fzf-lua").lsp_code_actions() end, desc = "[C]ode [A]ctions" },
})
