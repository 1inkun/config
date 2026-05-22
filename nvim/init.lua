require("vim._core.ui2").enable()
require("keymaps")
require("options")
require("config.lazy")
require("bufferline").setup({})
require("nvim-tree").setup()
require("config.keymaps")
require("lspconfig")
require("config.nvim-cmp")

-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- lspServer
-- vim.lsp.enable("clangd")
vim.lsp.enable("stylua")
vim.lsp.enable("vtsls")
-- vim.lsp.enable("vue_ls")

-- vim.lsp.codelens.enable(true, { bufnr = 0 })
