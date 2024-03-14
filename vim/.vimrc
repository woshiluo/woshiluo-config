"----------------------------------------------------------------
" Vim - Plug Configure
"----------------------------------------------------------------
call plug#begin('~/.vim/plugged')

""" Startify
" Plug 'chxuan/vimplus-startify'                 

""" Nerdtree
Plug 'scrooloose/nerdtree'


""" Template
Plug 'aperezdc/vim-template'

" Airline
Plug 'vim-airline/vim-airline'                 
Plug 'vim-airline/vim-airline-themes'          

" Plug 'jdkanani/vim-material-theme'

""" Language

" Rust
Plug 'majutsushi/tagbar'
Plug 'rust-lang/rust.vim'

" Latex
" Plug 'sirver/ultisnips'
Plug 'lervag/vimtex'
" Plug 'sillybun/zyt-snippet'

" Auto complete
Plug 'dense-analysis/ale'

" Vue
"Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

" Markdown 
" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" SQL 
Plug 'vim-scripts/dbext.vim'

" Yuck
Plug 'elkowar/yuck.vim'
 
" Plug 'black-desk/fcitx5-ui.nvim'

"""  Enhance
" Autoformat 
" Plug 'Chiel92/vim-autoformat' 
" Align = or <space>
" Plug 'junegunn/vim-easy-align' 
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" Git support
Plug 'tpope/vim-fugitive' 
" 
" " Script
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

set incsearch

set t_Co=256

" set background=dark
" colorscheme material-theme

" For fcitx.vim
set ttimeoutlen=100

augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

augroup project
	  autocmd!
	  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab

"----------------------------------------------------------------
" Encoding configure
"----------------------------------------------------------------
set encoding=utf-8
set langmenu=en_US.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8
set ambiwidth=double
set mouse-=a

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
nmap <F10> :!gedit "%"<CR>
nmap <F12> :call Compile()<CR>

set pastetoggle=<F6>

nmap <C-N> :bn<CR>
nmap <C-P> :bp<CR>

"----------------------------------------------------------
" User Function Configure 
"----------------------------------------------------------

let g:compile_options='-lm -std=c++20 -Wall -Wextra -Wshadow -Dwoshiluo -fsanitize=address'
" let g:compile_options='-lm -std=c++20 -Wall -Wextra -Dwoshiluo'
func! Debug()
	if expand( '%:e' ) == 'cpp' 
		exec '!g++ %<.cpp -o %<.run -g -DDEBUG ' . g:compile_options . '&& gdb ./%<.run'
	endif
endfunc

func! Compile()
	if expand( '%:e' ) == 'html'
		exec '!firefox %:p'
	elseif expand( '%:e' ) == 'tex' 
		exec '!(tectonic % ) && echo "50\%..." && (tectonic %>/dev/null 2>&1) && echo "100\%...Done" && ( rm -f %<.aux %<.log %<.toc %<.out %<.nav %<.snm) && firefox %<.pdf'
	elseif expand( '%:e' ) == 'md' 
		exec '!md2pdf.sh %<.md %<.pdf && firefox %<.pdf'
	elseif expand( '%:e' ) == 'rs'
		exec '!cargo run'
	elseif expand( '%:e' ) == 'py'
		exec '!python %<.py'
	elseif expand( '%:e' ) == 'php'
		exec '!php %<.php'
	else
		exec '!g++ %<.cpp -o %<.run -O2 ' . g:compile_options . ' && time ASAN_OPTIONS=detect_leaks=0 ./%<.run'
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

let g:ale_completion_enabled = 1
let g:ale_linters = { 'rust': ['analyzer'], 'cpp': ['clangd'], 'c': [ 'clangd' ], 'typescript': ['tsserver'], 'typescriptreact': ['tsserver'], 'vue': ['volar'], 'java': ['javalsp'], 'go': ['gopls']  }
let g:ale_fixers = { 'c': [ 'clang-format' ], 'go': [ 'gofmt' ], 'vue': [ 'prettier' ], 'typescript': ['eslint'] }
let g:ale_cpp_cc_options = g:compile_options
let g:ale_c_parse_compile_commands = 1
let g:airline#extensions#ale#enabled = 1
set omnifunc=ale#completion#OmniFunc

"----------------------------------------------------------------
" Vim - clap Configure
"----------------------------------------------------------------
let g:clap_theme = 'material_design_dark'

"----------------------------------------------------------------
" ddc.nvim Configure
"----------------------------------------------------------------

" call ddc#enable()

"----------------------------------------------------------------
" Vim - Mucomplete Configure
"----------------------------------------------------------------

" set completeopt+=noselect
" set completeopt+=menuone,noselect
" set completeopt=menu,menuone,preview,noselect,noinsert
" set shortmess+=c   " Shut off completion messages
" set belloff+=ctrlg " If Vim beeps during completion
" let g:mucomplete#chains = {}
" let g:mucomplete#chains.default = ['omni', 'c-n', 'path']
" let g:mucomplete#enable_auto_at_startup = 1
" let g:clang_complete_auto = 1
"let g:mucomplete#minimum_prefix_length = 3

"----------------------------------------------------------------
" Vim - Markdown Configure
"----------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1

"----------------------------------------------------------------
" Vim - Template Configure
"----------------------------------------------------------------
let g:templates_directory = ['/home/woshiluo/Templates',]
let g:license = "GNU AGPLv3+"
let g:user = "Woshiluo Luo"
let g:email = "woshiluo.luo@outlook.com"

"----------------------------------------------------------------
" Vim - Airline Configure
"----------------------------------------------------------------
let g:airline_theme="luna"
" let g:airline_theme="nord"                   
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_powerline_fonts = 1   

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
