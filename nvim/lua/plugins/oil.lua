return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Oil" },
	},
	lazy = false,
}
