return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return {
				options = {
					icons_enabled = true,
					theme = "gruvbox-material",
					always_divide_middle = false,
					always_show_tabline = true,
				},
			}
		end,
	},
}
