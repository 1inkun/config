-- cmp
local cmp = require("cmp")
cmp.setup({
	performance = {
		max_view_entries = 8,
	},
	view = {
		docs = {
			auto_open = false,
		},
	},
	preselect = cmp.PreselectMode.None,
	mapping = {
      ['<C-g>'] = function()
        if cmp.visible_docs() then
          cmp.close_docs()
        else
          cmp.open_docs()
        end
      end
    }
})
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})
