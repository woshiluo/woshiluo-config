"----------------------------------------------------------------
" Vim - Plug Configure
"----------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Startify
Plug 'chxuan/vimplus-startify'                 " 启动界面

" Nerdtree
Plug 'scrooloose/nerdtree'                     " 目录树
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " 目录树美化

" Airline
Plug 'vim-airline/vim-airline'                 " 状态栏美化
Plug 'vim-airline/vim-airline-themes'          " 状态栏美化主题

" Plug 'arcticicestudio/nord-vim'

" Plug 'jdkanani/vim-material-theme'

" Rust
Plug 'majutsushi/tagbar'
Plug 'rust-lang/rust.vim'

" Vue
Plug 'posva/vim-vue'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " Markdown Preview
Plug 'godlygeek/tabular' "The dep which is next one
Plug 'plasticboy/vim-markdown' "Markdown syntax support

" Enhance
" Plug 'Chiel92/vim-autoformat' "Autoformat 
Plug 'junegunn/vim-easy-align' "Align = or <space>
Plug 'tpope/vim-fugitive' " Git support

" Script
" Plug 'lilydjwg/fcitx.vim'
call plug#end()

let g:python3_host_prog='~/.local/bin'

"----------------------------------------------------------- 
" Based Configure  
"----------------------------------------------------------- 
set nu
syntax on
set ts=4
set sts=4
set sw=4
set autoindent
set cindent

set t_Co=256

" set background=dark
" colorscheme material-theme


"----------------------------------------------------------------
" Encoding configure
"----------------------------------------------------------------
"Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)        
set encoding=utf-8
set langmenu=en_US.UTF-8
" 设置打开文件的编码格式  
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8
"设置为双字宽显示
set ambiwidth=double

"set fdm=indent " 代码折叠
set fdm=marker

" colorscheme nord

"----------------------------------------------------------
" Map Configure 
"----------------------------------------------------------
nmap <F2> :e %<.cpp<CR>
nmap <F3> :e %<.in<CR>
nmap <F4> :e %<.out<CR>
nmap <F5> :call Debug()<CR>
nmap <F9> :NERDTreeToggle<CR>
nmap <F10> :!gedit %<CR>
nmap <F12> :call Compile()<CR>

" 设置切换Buffer快捷键
nmap <C-N> :bn<CR>
nmap <C-P> :bp<CR>

let g:compile_options='-lm -std=c++20 -Wall -Wextra -Dwoshiluo'
func! Debug()
	if expand( '%:e' ) == 'cpp' 
		exec '!ccache g++ %<.cpp -o %<.run -g ' . g:compile_options . '&& gdb ./%<.run'
	endif
endfunc

func! Compile()
	if expand( '%:e' ) == 'html'
		exec '!firefox %:p'
	elseif expand( '%:e' ) == 'tex' 
		exec '!(xelatex % ) && echo "50\%..." && (xelatex %>/dev/null 2>&1) && echo "100\%...Done" && ( rm -f %<.aux %<.log %<.toc %<.out %<.nav %<.snm) && firefox %<.pdf'
	elseif expand( '%:e' ) == 'rs'
		exec '!cargo run'
	else
		exec '!ccache g++ %<.cpp -o %<.run -O2 ' . g:compile_options . ' && time ./%<.run'
	endif
endfunc

command Topcodermode call Topcoder_mode()
func! Topcoder_mode() 
	nmap <F5> :!g++ %<.cpp -o %<.run -g -lm -std=c++14 -Wall -Wextra -Dwoshiluo && gdb ./%<.run<CR>
	nmap <F12> :!g++ %<.cpp -o %<.run -O2 -lm -std=c++14 -Wall -Wextra -Dwoshiluo && time ./%<.run<CR>
endfunc

command CFmode call CF_mode()
func! CF_mode() 
	command CF !cf
endfunc


"----------------------------------------------------------------
" Vim - Nerdtree Syntax Highlight Configure
"----------------------------------------------------------------

" let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
" let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

"----------------------------------------------------------------
" Vim - Tagbar Configure
"----------------------------------------------------------------

nmap <F8> :TagbarToggle<CR>

"----------------------------------------------------------------
" Vim - Vue Configure
"----------------------------------------------------------------

autocmd FileType vue syntax sync fromstart

"----------------------------------------------------------------
" Vim - Rust Configure
"----------------------------------------------------------------

let g:rustfmt_autosave = 1

"----------------------------------------------------------------
" Vim - EasyAlign Configure
"----------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"----------------------------------------------------------------
" Vim - Markdown Configure
"----------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1

"----------------------------------------------------------------
" Vim - Rainbow Configure
"----------------------------------------------------------------
let g:rainbow_active = 1

let g:rainbow_conf = {	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],	'operators': '_,_',	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],	'separately': {		'*': {},		'tex': {			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],		},		'lisp': {			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],		},		'vim': {			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],		},		'html': {			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],		},		'css': 0,	}}

"----------------------------------------------------------------
" Vim - Airline Configure
"----------------------------------------------------------------
" let g:airline_theme="luna"                   " 主题配色
let g:airline_theme="nord"                   " 主题配色
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" 这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   

" 打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 设置切换Buffer快捷键
nmap <C-N> :bn<CR>
nmap <C-P> :bp<CR>

" 置关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

" 自动退出
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

"----------------------------------------------------------
" YouCompleteMe Configure
"----------------------------------------------------------
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" " 自动补全配置
" set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
" inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
" "上下左右键的行为 会显示其他信息
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" "youcompleteme  默认tab  s-tab 和自动补全冲突
" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion = ['<Up>']
" let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
" let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
" let g:ycm_min_num_of_chars_for_completion=4 " 从第2个键入字符就开始罗列匹配项
" let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
" let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
" 
" "在字符串输入中也能补全
" let g:ycm_complete_in_strings = 1
" "注释和字符串中的文字也会被收入补全
" let g:ycm_collect_identifiers_from_comments_and_strings = 0
" let g:clang_user_options='|| exit 0'
" Based Configure  
"----------------------------------------------------------- 
set nu
syntax on
set ts=4
set sts=4
set sw=4
set autoindent
set cindent

set t_Co=256


"----------------------------------------------------------------
" Encoding configure
"----------------------------------------------------------------
"Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)        
set encoding=utf-8
set langmenu=zh_CN.UTF-8
" 设置打开文件的编码格式  
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8
"设置为双字宽显示
set ambiwidth=double

"set fdm=indent " 代码折叠
set fdm=marker

"----------------------------------------------------------
" Map Configure 
"----------------------------------------------------------
nmap <F2> :e %<.cpp<CR>
nmap <F3> :e %<.in<CR>
nmap <F4> :e %<.out<CR>
nmap <F5> :call Debug()<CR>
nmap <F9> :NERDTreeToggle<CR>
nmap <F10> :!gedit %<CR>
nmap <F12> :call Compile()<CR>

let g:compile_options='-lm -std=c++20 -Wall -Wextra -Dwoshiluo'
func! Debug()
	if expand( '%:e' ) == 'cpp' 
		exec '!ccache g++ %<.cpp -o %<.run -g ' . g:compile_options . '&& gdb ./%<.run'
	endif
endfunc

func! Compile()
	if expand( '%:e' ) == 'html'
		exec '!firefox %:p'
	elseif expand( '%:e' ) == 'tex' 
		exec '!(xelatex % ) && echo "50\%..." && (xelatex %>/dev/null 2>&1) && echo "100\%...Done" && ( rm -f %<.aux %<.log %<.toc %<.out %<.nav %<.snm) && firefox %<.pdf'
	elseif expand( '%:e' ) == 'rs'
		exec '!cargo run'
	else
		exec '!ccache g++ %<.cpp -o %<.run -O2 ' . g:compile_options . ' && time ./%<.run'
	endif
endfunc

" command Topcodermode call Topcoder_mode()
" func! Topcoder_mode() 
" 	nmap <F5> :!g++ %<.cpp -o %<.run -g -lm -std=c++14 -Wall -Wextra -Dwoshiluo && gdb ./%<.run<CR>
" 	nmap <F12> :!g++ %<.cpp -o %<.run -O2 -lm -std=c++14 -Wall -Wextra -Dwoshiluo && time ./%<.run<CR>
" endfunc
" 
" command CFmode call CF_mode()
" func! CF_mode() 
" 	command CF !cf
" endfunc

"----------------------------------------------------------------
" Vim - Nerdtree Syntax Highlight Configure
"----------------------------------------------------------------

" let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
" let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

"----------------------------------------------------------------
" Vim - Tagbar Configure
"----------------------------------------------------------------

nmap <F8> :TagbarToggle<CR>

"----------------------------------------------------------------
" Vim - Vue Configure
"----------------------------------------------------------------

autocmd FileType vue syntax sync fromstart

"----------------------------------------------------------------
" Vim - Rust Configure
"----------------------------------------------------------------

let g:rustfmt_autosave = 1

"----------------------------------------------------------------
" Vim - EasyAlign Configure
"----------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"----------------------------------------------------------------
" Vim - Markdown Configure
"----------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1

"----------------------------------------------------------------
" Vim - Airline Configure
"----------------------------------------------------------------
let g:airline_theme="luna"                   " 主题配色
" let g:airline_theme="nord"                   " 主题配色
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" 这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   

" 打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 置关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

" 自动退出
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
