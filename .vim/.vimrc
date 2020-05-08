call plug#begin('~/.vim/plugged')

""""""目录树
Plug 'preservim/nerdtree'
""""""状态栏优化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
""""""代码对齐
Plug 'godlygeek/tabular'
""""""主题
Plug 'altercation/vim-colors-solarized'
""""""匹配括号
Plug 'jiangmiao/auto-pairs'
""""""vim-go""""""
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"""""gocode"""""
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
"""""markdowm"""""
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'Valloric/YouCompleteMe'

call plug#end()



inoremap jj <esc>
set nu
set sm
set ai
set hlsearch
syntax on
set ic
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

"html代码补全


"""""""""""""" 将空格键当作快捷键 """"""""""""""""""
let mapleader=" "
map <leader>wq :wq<CR>
map <leader>q :q<CR>
map <leader>w :w<CR>
map <leader>u :sp<CR>
map <leader>r :vsp<CR>
map <leader>p :tabp<CR>
map <leader>n :tabn<CR>
map <leader>s :tabs<CR>
map <leader>o :tabo<CR>
map <leader>c :tabc<CR>
map <leader>ew :tabnew
map <leader>a <C-w>
map <leader>j :! 
map <leader>gr :GoRun<CR>

imap ii <C-x><C-o>

""""""""""""""""""""""目录树""""""""""""""""""""
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map ff :NERDTreeToggle<CR>


""""""""""""""""""""标签导航"""""""""""
"""""""""""状态栏优化

let g:airline_powerline_fonts                   = 1 " 使用 powerline 打过补丁的字体
let g:airline#extensions#tabline#enabled        = 1 " 开启 tabline
let g:airline#extensions#tabline#buffer_nr_show = 1 " 显示 buffer 编号
let g:airline#extensions#ale#enabled            = 1 " enable ale integration

" 状态栏显示图标设置
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_symbols.crypt     = '?'
let g:airline_symbols.linenr    = '⭡'
let g:airline_symbols.branch    = '⭠'
" 切换 buffer
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" 关闭当前 buffer
noremap <C-p> :w<CR>:bd<CR>
" <leader>1~9 切到 buffer1~9
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

"""""""主题
let g:solarized_termtrans  = 1        " 使用 termnal 背
let g:solarized_visibility = "high"   " 使用 :set list 显示特殊字符时的高亮级别






"""""""""""YouCompleteMe"""""""""""
" 自动补全配置
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme 默认tab s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR> "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
