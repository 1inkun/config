-- 设置 mapleader 键（前缀键），用于触发自定义快捷键，默认为 "\"
vim.g.mapleader = " "
-- 设置 localleader 键（局部前缀键），用于文件类型特定映射
vim.g.maplocalleader = " "
-- 设置别名
local map = vim.keymap.set

-- buffers
vim.keymap.set("n", "<leader>n", ":bn<cr>")
vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader>x", ":bd<cr>")

-- terminal
-- vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = "在终端模式下使用 ESC 回到普通模式" }

-- healthCheck
map("n", "<leader>ch", ":checkhealth<cr>")

-- 快速保存文件 (普通模式和插入模式都可用)
map("n", "<C-s>", ":w<CR>", { desc = "保存文件" })
map("i", "<C-s>", "<ESC>:w<CR>a", { desc = "保存文件" })

-- 清除搜索高亮 (按 ESC 两次)
map("n", "<ESC><ESC>", ":nohlsearch<CR>", { desc = "清除搜索高亮" })

-- 更好的光标移动（折行处理：按行视觉移动而非逻辑行）
map("n", "j", "v:count ? 'j' : 'gj'", { expr = true, desc = "下移（处理折行）" })
map("n", "k", "v:count ? 'k' : 'gk'", { expr = true, desc = "上移（处理折行）" })
