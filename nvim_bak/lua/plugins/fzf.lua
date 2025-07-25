return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "[F]ind [F]iles",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").grep_project()
			end,
			desc = "[F]ind by [G]rep",
		},
		{
			"<leader>ls",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			desc = "[L]ist Document [S]ymbols",
		},
		{
			"gd",
			function()
				require("fzf-lua").lsp_definitions()
			end,
			desc = "[G]o to [D]efinition",
		},
		{
			"<leader>ld",
			function()
				require("fzf-lua").diagnostics_workspace()
			end,
			desc = "[L]ist [D]iagnostics",
		},
		{
			"<leader>ca",
			function()
				require("fzf-lua").lsp_code_actions()
			end,
			desc = "[C]ode [A]ctions",
		},
	},
}
