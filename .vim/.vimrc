
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
set incsearch
set wildmenu
set norelativenumber
set cursorline
set wrap
"高亮显示当前列
set cursorcolumn
"显示光标当前位置
set ruler

"html代码补全


"""""""""""""" 将空格键当作快捷键 """"""""""""""""""
let mapleader=" "
map <leader>wq :wq<CR>
map <leader>q :q!<CR>
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


call plug#begin('~/.vim/plugs')

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
"""""缩进线"""""
Plug 'Yggdroot/indentLine'
"""""代码补全"""""
Plug 'ycm-core/YouCompleteMe'
"""""悬浮终端"""""
Plug 'voldikss/vim-floaterm'
"""""tagbar"""""
Plug 'majutsushi/tagbar'

call plug#end()


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

""""""缩进线""""""
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


"""""python补全"""""
" cd ~/.vim/plugs
" git clone https://github.com/rkulla/pydiction.git

let g:pydiction_location = '~/.vim/plugs/pydiction/complete-dict'
let g:pydiction_menu_height = 3

""""悬浮窗口""""
map <leader>o :FloatermNew<CR>

""""vim-go""""
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2
map <leader>g GoRun<CR>

""""tagbar""""
nmap <F1> :TagbarToggle<CR>
let g:tagbar_width=25
let g:tagbar_ctags_bin="~/go/bin"
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
