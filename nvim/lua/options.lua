-- 启用内置终端真彩色支持 (termguicolors)，使主题显示更丰富
vim.opt.termguicolors = true

-- ============================================================================
--  编辑行为 (Editing Behavior)
-- ============================================================================
-- 行号显示和相对行号
vim.opt.nu = true
vim.opt.relativenumber = true
-- 缩进
vim.opt.tabstop = 4 -- 一个 <Tab> 等于 4 个空格
vim.opt.shiftwidth = 4 -- 缩进级别（按 >> 或 << 时移动的空格数）
vim.opt.softtabstop = 4 -- 输入 <Tab> 时的空格数
vim.opt.expandtab = true -- 用空格代替 tab 字符
-- 开启自动换行（按窗口宽度换行，不改变实际文件内容）
vim.opt.wrap = true
-- 高亮当前光标所在行
vim.opt.cursorline = true
-- 启用鼠标支持（所有模式：n, v, i, c）
vim.opt.mouse = "a"
-- 设置编码为 UTF-8
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- ============================================================================
--  搜索与匹配 (Search & Match)
-- ============================================================================
-- 增量搜索（每输入一个字符就立即高亮匹配结果）
vim.opt.incsearch = true
-- 搜索时忽略大小写
vim.opt.ignorecase = true
-- 如果搜索模式包含大写字母，则覆盖 ignorecase，变为大小写敏感
vim.opt.smartcase = true
