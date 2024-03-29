set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'Yggdroot/indentLine'
Bundle 'edkolev/tmuxline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-------------------------------------------------------------------------------------------
"
set mouse=a
set t_Co=256

" If on tmux, use ttymouse=xterm2
if $TERM == 'tmux-256color'
	set ttymouse=xterm2
endif

"vim tabs
"set tabstop=4 shiftwidth=4 expandtab
autocmd FileType * set tabstop=3|set shiftwidth=3|set noexpandtab
autocmd FileType c set tabstop=3|set shiftwidth=3|set expandtab
autocmd FileType xml set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType vala set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

" Filetypes
augroup filetypedetect
        au! BufRead,BufNewFile *.vala,*.vapi setfiletype vala
augroup END

augroup vala
		  autocmd BufRead *.vala,*.vapi set efm=%f:%1.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
augroup END

" Disable valadoc syntax highlight
"let vala_ignore_valadoc = 1

" Enable comment strings
let vala_comment_strings = 1

" Highlight space errors
let vala_space_errors = 1

" Disable trailing space errors
let vala_no_trail_space_error = 1

" Disable space-tab-space errors
let vala_no_tab_space_error = 1

" Minimum lines used for comment syncing (default 50)
"let vala_minlines = 120

"-------------------------------------------------------------------
" Work-around Tag List for Vala (not being used)
"let tlist_vala_settings='c#;d:macro;t:typedef;n:namespace;c:class;'.
"  \ 'E:event;g:enum;s:struct;i:interface;'.
"  \ 'p:properties;m:method'

"-------------------------------------------------------------------
" Vala tagbar ctags
" Commented as vala tags are broken!
"let g:tagbar_ctags_bin = "/usr/bin/anjuta-tags"


" NERDTree quit vim if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"NERDTree Auto open nerdtree on vim startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree Filter (Vala, filter .c and .o)
let NERDTreeIgnore=['\.c$','\.o$']

" -----------------------------------------------------------------
" Airline settings
" -----------------------------------------------------------------
"  https://github.com/vim-airline/vim-airline/wiki/Screenshots
" -----------------------------------------------------------------
set laststatus=2
let g:airline_theme='dark'
"let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tmuxline#enabled = 0

" Keyboard mappings
" -----------------------------------------------------------------
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <F4> :TagbarToggle<CR>
nmap <silent> <F5> :IndentLinesToggle<CR>

" Set default colorscheme
" -----------------------
colorscheme valloric


" ToggleColorColumn to mark column 80
" Use F3 to toggle
" -----------------------------------
highlight ColorColumn ctermbg=235 guibg=#2c2d27

fun! ToggleCC()
   if &cc == ''
	   exec "set cc=".join(range(80,999),",")
	else
	   set cc=
	endif
endfun

nnoremap <F3> :call ToggleCC()<CR>

" Dots for spaces and so on
" -------------------------
set listchars=tab:→\ ,space:·
nnoremap <F6> :set list! list?<CR>

" Toggle Line numbers
" -------------------
nnoremap <F7> :set nu! nu?<CR>

augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END
