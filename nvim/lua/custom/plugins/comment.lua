return {
	"numToStr/Comment.nvim",
	opts = {

	},
	config = function()
		require("Comment").setup({
			toggler = {
				line = "gcc",
			},
		})
	end,
	lazy = false,
}
