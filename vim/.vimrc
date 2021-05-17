"----------------------------------------------------------------
" Vim - Plug Configure
"----------------------------------------------------------------
call plug#begin('~/.vim/plugged')

""" Startify
" Plug 'chxuan/vimplus-startify'                 

""" Nerdtree
" 目录树
Plug 'scrooloose/nerdtree'                     

" Airline
" 状态栏美化
Plug 'vim-airline/vim-airline'                 
" 状态栏美化主题
Plug 'vim-airline/vim-airline-themes'          

" Plug 'jdkanani/vim-material-theme'

""" Language

" Rust
Plug 'majutsushi/tagbar'
Plug 'rust-lang/rust.vim'

" Auto complete
if expand( '%:e' ) != 'cpp'
	Plug 'lifepillar/vim-mucomplete'
	Plug 'dense-analysis/ale'
"	Plug 'autozimu/LanguageClient-neovim', {
"				\ 'branch': 'next',
"				\ 'do': 'bash install.sh',
"				\ }
endif

" Vue
Plug 'posva/vim-vue'

" Markdown 
" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" SQL 
Plug 'vim-scripts/dbext.vim'

"""  Enhance
" Autoformat 
" Plug 'Chiel92/vim-autoformat' 
" Align = or <space>
" Plug 'junegunn/vim-easy-align' 

" Git support
Plug 'tpope/vim-fugitive' 

" Script
Plug 'lilydjwg/fcitx.vim'
call plug#end() 

" let g:python3_host_prog='~/.local/bin'

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

augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab

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

set pastetoggle=<F6>

" 设置切换Buffer快捷键
nmap <C-N> :bn<CR>
nmap <C-P> :bp<CR>

"----------------------------------------------------------
" User Function Configure 
"----------------------------------------------------------

let g:compile_options='-lm -std=c++20 -Wall -Wextra -Wshadow -Dwoshiluo -fsanitize=address'
" let g:compile_options='-lm -std=c++20 -Wall -Wextra -Dwoshiluo'
func! Debug()
	if expand( '%:e' ) == 'cpp' 
		exec '!g++ %<.cpp -o %<.run -g ' . g:compile_options . '&& gdb ./%<.run'
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
		exec '!g++ %<.cpp -o %<.run -O2 ' . g:compile_options . ' && time ./%<.run'
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
" Vim - ale Configure
"----------------------------------------------------------------

let g:ale_linters = {'rust': ['analyzer']}
let g:airline#extensions#ale#enabled = 1
set omnifunc=ale#completion#OmniFunc

"----------------------------------------------------------------
" LanguageClient-neovim Configure
"----------------------------------------------------------------

" let g:LanguageClient_diagnosticsEnable = 0
" let g:LanguageClient_serverCommands = {
" \ 'rust': ['rust-analyzer'],
" \ }
" set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['rustup', 'run', 'stable', 'rls'],
"     \ }
" let g:LanguageClient_loggingLevel = 'INFO'
" let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
" let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

"----------------------------------------------------------------
" Vim - Mucomplete Configure
"----------------------------------------------------------------

" set completeopt+=noselect
set completeopt+=menuone,noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1
"let g:mucomplete#minimum_prefix_length = 3

"----------------------------------------------------------------
" Vim - EasyAlign Configure
"----------------------------------------------------------------

" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

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
