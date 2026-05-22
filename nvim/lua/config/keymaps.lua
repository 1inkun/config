-- fzf
vim.keymap.set("n", "<leader>gh", ":FzfLua files<cr>")
vim.keymap.set("n", "<leader>gg", ":FzfLua resume<cr>")
-- tree
vim.keymap.set("n", "<leader>w", ":NvimTreeOpen<cr>")
vim.keymap.set("n", "<leader>q", ":NvimTreeClose<cr>")
-- luasnip
local ls = require("luasnip")

vim.keymap.set({ "i" }, "<C-K>", function()
	ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
	ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
