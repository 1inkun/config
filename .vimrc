" ============================================================================
" .vimrc 配置文件模板
" ============================================================================

" ---- 基础设置 ---------------------------------------------------------------

" 关闭 vi 兼容模式，启用 Vim 特有功能
set nocompatible

" 启用文件类型检测、插件和缩进
"filetype plugin indent on

" 开启语法高亮
syntax on

" ---- 编码 -------------------------------------------------------------------

" 设置 Vim 内部编码
set encoding=utf-8

" 设置文件默认编码
set fileencoding=utf-8

" 设置终端编码
set termencoding=utf-8

" 自动判断文件编码时的优先级
"set fileencodings=utf-8,gbk,gb2312,cp936,latin-1

" ---- 外观 -------------------------------------------------------------------
" 主题
colorscheme corporation

" 显示行号
set number

" 显示相对行号（当前行为 0，方便跳转）
set relativenumber

" 高亮当前行
set cursorline

" 高亮当前列
" set cursorcolumn

" 显示标题栏
set title

" 在状态栏显示当前模式（INSERT/VISUAL 等）
set showmode

" 在右下角显示未完成的命令
set showcmd

" 总是显示状态栏
set laststatus=2

" 设置状态栏格式
"set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [POS=%l,%v][%p%%]

" 设置命令行高度
set cmdheight=1

" 不在命令行显示当前模式（showmode 已显示）
"set noshowmode

" 括号匹配高亮
set showmatch

" 括号匹配高亮时长（单位：0.1 秒）
set matchtime=2

" 高亮第 80 列作为参考线
"set colorcolumn=80

" ---- 编辑行为 ---------------------------------------------------------------

" 设置退格键可删除的内容（行首缩进、换行符、插入起始位置之前）
set backspace=indent,eol,start

" 启用鼠标支持
set mouse=a

" 在行首/行尾按左右键时不换行
set whichwrap+=<,>,h,l

" 允许隐藏未保存的缓冲区
set hidden

" 开启剪贴板共享（需要 +clipboard 特性）
"set clipboard=unnamed

" 撤销历史数量
set undolevels=512

" 启用持久撤销，关闭 Vim 后仍可撤销（需要 undodir 目录存在）
set undofile
set undodir=~/.vim/undodir

" 交换文件目录（避免在工作目录产生 .swp 文件）

" 当文件被外部修改时自动重新读取
set autoread

" 光标至少距离屏幕顶部/底部 N 行
"set scrolloff=4

" 光标至少距离屏幕左/右 N 列
"set sidescrolloff=4

" ---- 缩进和制表符 -----------------------------------------------------------

" 使用空格代替 Tab
set expandtab

" Tab 宽度（空格数）
set tabstop=4

" 自动缩进时使用的空格数
set shiftwidth=4

" 软制表符宽度（Tab 键和退格键影响的空格数）
set softtabstop=4

" 开启自动缩进
set autoindent

" 开启智能缩进（根据语法自动调整）
set smartindent

" 将 Tab 替换为空格时，退格可以一次删除 N 个空格
set smarttab

" ---- 搜索 -------------------------------------------------------------------

" 增量搜索（边输入边搜索）
set incsearch

" 高亮搜索结果
set hlsearch

" 搜索时忽略大小写
set ignorecase

" 当搜索词包含大写字母时，自动区分大小写
set smartcase

" 搜索结果高亮时，用空格键清除高亮
"nnoremap <silent> <Space> :nohlsearch<Bar>echo<CR>

" ---- 代码折叠 ---------------------------------------------------------------

" 启用代码折叠
"set foldenable

" 折叠方式：手动(manual) / 缩进(indent) / 语法(syntax) / 标记(marker)
"set foldmethod=indent

" 打开文件时默认不折叠
"set foldlevelstart=99

" 折叠列宽度
"set foldcolumn=0

" 使用空格键切换折叠
"nnoremap <silent> <leader>za za

" ---- 补全 -------------------------------------------------------------------

" 命令行补全增强
set wildmenu
set wildmode=longest:full,full

" 忽略的文件/目录（补全和搜索时排除）
set wildignore=*.o,*.obj,*.pyc,*.class,*.swp,*.bak,*.DS_Store,node_modules/*,.git/*

" ---- 备份和交换文件 ---------------------------------------------------------

" 关闭备份文件
set nobackup

" 关闭交换文件（谨慎使用，崩溃时无法恢复）
" set noswapfile

" 交换文件目录
" set directory=~/.vim/swp

" ---- 快捷键 ------------------------------------------------------------------

" 设置 leader 键为空格
"let mapleader = " "

" ; 代替 : 进入命令行模式
"nnoremap ; :

" 使用 jk 快速退出插入模式
"inoremap jk <Esc>

" 使用 Ctrl+H/J/K/L 在窗口间移动
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" 移动行：Alt+J/K 将当前行上移/下移
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

" 使用 Ctrl+S 保存文件
"nnoremap <C-s> :w<CR>
"inoremap <C-s> <Esc>:w<CR>a

" 使用 Tab 在缓冲区之间切换
"nnoremap <Tab> :bnext<CR>
"nnoremap <S-Tab> :bprevious<CR>

" 快速打开/关闭 NERDTree 风格的文件浏览器（使用 netrw）
"nnoremap <leader>e :Explore<CR>

" ---- 文件类型特定配置 --------------------------------------------------------

" Markdown / 纯文本：自动折行
"autocmd FileType markdown,text setlocal wrap linebreak nolist

" Python：PEP 8 风格（4 空格缩进）
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

" JavaScript / TypeScript / HTML / CSS：2 空格缩进
autocmd FileType javascript,typescript,html,css,scss,json,yaml setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Makefile：使用 Tab 而非空格
autocmd FileType make setlocal noexpandtab

" ---- 性能优化 ---------------------------------------------------------------

" 关闭兼容旧版 Vi 的正则引擎
set regexpengine=1

" 延迟编写交换文件（减少磁盘 I/O）
set updatetime=300

" 语法高亮同步行数（避免大文件卡顿）
set synmaxcol=200

" 关闭错误响铃
set noerrorbells
set visualbell

" ---- Vim-Plug 插件管理器示例 ------------------------------------------------

" 安装方法（终端执行）：
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" call plug#begin('~/.vim/plugged')
"
" " 外观主题
" Plug 'morhetz/gruvbox'
"
" " 文件树
" Plug 'preservim/nerdtree'
"
" " 模糊查找
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
"
" " 状态栏
" Plug 'vim-airline/vim-airline'
"
" " 注释插件 (gcc 注释当前行, gc 注释选中区域)
" Plug 'tpope/vim-commentary'
"
" " 自动补全括号
" Plug 'jiangmiao/auto-pairs'
"
" " Git 集成
" Plug 'tpope/vim-fugitive'
"
" " 代码对齐
" Plug 'junegunn/vim-easy-align'
"
" call plug#end()
"
" " 主题设置
" colorscheme gruvbox
" set background=dark
