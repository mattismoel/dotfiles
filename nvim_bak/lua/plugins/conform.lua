return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fd",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "[F]ormat [D]ocument",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier", stop_after_first = true },
		},
		-- default_format_opts = { lsp_format = "fallback" },
		format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
	},
	-- config = function()
	--   vim.api.nvim_create_user_command("Format", function(args)
	--     local range = nil
	--     if args.count ~= -1 then
	--       local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
	--       range = {
	--         start = { args.line1, 0 },
	--         ["end"] = { args.line2, end_line:len() },
	--       }
	--     end
	--     require("conform").format({ async = true, lsp_format = "fallback", range = range })
	--   end, { range = true })
	-- end
}
