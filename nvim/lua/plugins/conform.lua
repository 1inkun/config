return {
	{
		"stevearc/conform.nvim",
		opts = function()
			return {
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					html = { "prettierd" },
					css = { "prettierd" },
					c = { "clang-format" },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			}
		end,
	},
}
