require("config.lazy")
require("bufferline").setup{}
require("nvim-tree").setup()
require("keymaps")
require("plugins.keymaps")
require("options")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
