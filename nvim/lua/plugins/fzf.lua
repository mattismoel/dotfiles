return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = {},
  keys = {
    { "<leader>sf", function() require("fzf-lua").files() end,                 desc = "[S]earch [F]iles" },
    { "<leader>sb", function() require("fzf-lua").buffers() end,               desc = "[S]earch [B]uffers" },
    { "<leader>sg", function() require("fzf-lua").live_grep_native() end,      desc = "[S]earch [B]uffers" },

    { "<leader>sd", function() require("fzf-lua").diagnostics_workspace() end, desc = "[S]earch [D]iagnostics (Workspace)" },
    { "<leader>sD", function() require("fzf-lua").diagnostics_document() end,  desc = "[S]earch [D]iagnostics (Document)" },

    { "<leader>ca", function() require("fzf-lua").lsp_code_actions() end,      desc = "[C]ode [A]ctions" },
  }
}
