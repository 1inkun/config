require("vim._core.ui2").enable()
require("keymaps")
require("options")
require("config.lazy")
require("config.keymaps")
require("bufferline").setup({
	options = {
		style_preset = require("bufferline").style_preset.no_italic,
		separator_style = "thick",
	},
})
require("nvim-tree").setup()
require("lualine").setup()
require("lspconfig")
require("config.nvim-lint")
require("config.nvim-cmp")

-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- lspServer
vim.lsp.enable("vtsls")
vim.lsp.enable("html")

-- vim.lsp.codelens.enable(true, { bufnr = 0 })
