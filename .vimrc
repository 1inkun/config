" ---- 基础设置 ---------------------------------------------------------------

" 关闭 vi 兼容模式，启用 Vim 特有功能
set nocompatible

" 启用文件类型检测、插件和缩进
filetype plugin indent on

" 开启语法高亮
syntax on


" ---- 插件 -------------------------------------------------------------------
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'sainnhe/sonokai'
Plug 'junegunn/fzf'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ---- 插件配置 ---------------------------------------------------------------
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ---- 编码 -------------------------------------------------------------------

" 设置 Vim 内部编码
set encoding=utf-8

" 设置文件默认编码
set fileencoding=utf-8

" 设置终端编码
set termencoding=utf-8

" ---- 外观 -------------------------------------------------------------------
" 主题
if has('termguicolors')
    set termguicolors
endif

let g:sonokai_style = 'atlantis'
let g:sonokai_better_performance = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai

" 显示行号
set number

" 显示相对行号（当前行为 0，方便跳转）
set relativenumber

" 高亮当前行
set cursorline

" 括号匹配高亮
set showmatch

" 括号匹配高亮时长（单位：0.1 秒）
set matchtime=2

" ---- 编辑行为 ---------------------------------------------------------------

" 设置退格键可删除的内容（行首缩进、换行符、插入起始位置之前）
set backspace=indent,eol,start

" 启用鼠标支持
set mouse=a

" 在行首/行尾按左右键时不换行
set whichwrap+=<,>,h,l

" 允许隐藏未保存的缓冲区
set hidden

" 撤销历史数量
set undolevels=512

" 启用持久撤销，关闭 Vim 后仍可撤销（需要 undodir 目录存在）
set undofile
set undodir=~/.vim/undodir

" 当文件被外部修改时自动重新读取
set autoread

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

" ---- 补全 -------------------------------------------------------------------

" 命令行补全增强
set wildmenu
set wildmode=longest:full,full

" 忽略的文件/目录（补全和搜索时排除）
set wildignore=*.o,*.obj,*.pyc,*.class,*.swp,*.bak,*.DS_Store,node_modules/*,.git/*

" ---- 备份和交换文件 ---------------------------------------------------------

" 关闭备份文件
set nobackup
set nowritebackup

" 关闭交换文件（谨慎使用，崩溃时无法恢复）
" set noswapfile

" 交换文件目录
" set directory=~/.vim/swp

" ---- 快捷键 ------------------------------------------------------------------

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

