require("config.lazy")
require("bufferline").setup{}
require("nvim-tree").setup()
require("keymaps")
require("plugins.keymaps")
require("options")
require('lspconfig')

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- lspServer
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')

vim.lsp.enable('lua_ls')

vim.lsp.enable('vtsls')
vim.lsp.enable('vue_ls')
