-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
        {
            'sainnhe/sonokai',
            lazy = false,
            priority = 1000,
            config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        -- vim.g.sonokai_enable_italic = true
            vim.g.sonokai_style="espresso"
            vim.g.sonokai_disable_italic_comment=1
            vim.cmd.colorscheme('sonokai')
            end
        },
        { 'vim-airline/vim-airline', version = false },
        { 'vim-airline/vim-airline-themes', version = false },
	{ "rafamadriz/friendly-snippets" },
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
	{
  	    "ibhagwan/fzf-lua",
  	    -- optional for icon support
  	    dependencies = { "nvim-tree/nvim-web-devicons" },
  	    -- or if using mini.icons/mini.nvim
  		-- dependencies = { "nvim-mini/mini.icons" },
  	    ---@module "fzf-lua"
  	    ---@type fzf-lua.Config|{}
  	    ---@diagnostic disable: missing-fields
  	    opts = {}
  	    ---@diagnostic enable: missing-fields
	},
	{
	    "nvim-tree/nvim-tree.lua",
	    version = "*",
	    lazy = false,
	    dependencies = {
	    "nvim-tree/nvim-web-devicons",
	    },
	    config = function()
	    require("nvim-tree").setup {}
	    end,
	},
	{ "mason-org/mason.nvim",  opts = {}},
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
