let mapleader ="\<SPACE>" 
"-----------------------------------------------------------
"Plugin settings
"-----------------------------------------------------------
"for vundle,plugin manager
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'} "Status bar
"Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree' "file browser
"Plugin 'vim-syntastic/syntastic' "Syntax error checking within vim
Plugin 'SirVer/ultisnips' "snippet engine
Plugin 'honza/vim-snippets' "snippet data
Plugin 'port161/AutoComplPop_fork' "autoshow completion menu
"Plugin 'Shougo/neocomplete.vim' "autoshow completion menu
"Plugin 'ervandew/supertab' "tab cycling
Plugin 'thinca/vim-quickrun' "compile quickly
Plugin 'tpope/vim-surround' "Surround text with quotes, brackets etc
"Plugin 'kudabux/vim-srcery-drk' "colorscheme
Plugin 'ap/vim-css-color' "highlight html,css etc colors
Plugin 'lervag/vimtex' "latex
Plugin 'majutsushi/tagbar' "tag sidebar
Plugin 'skywind3000/asyncrun.vim'
Plugin 'scrooloose/nerdcommenter' "commenting
Plugin 'jiangmiao/auto-pairs' "insert bracets in pairs
Plugin 'ivanov/vim-ipython'
Plugin 'jamessan/vim-gnupg'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim' "fuzzy file search
Plugin 'ap/vim-buftabline' "buffer bar
"Plugin 'kynan/dokuvimki' "edit dokuwiki through vim

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"-----------------------------------------------------------
"Plugin settings
"-----------------------------------------------------------
"snippet settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["my_snippets","Ultisnips"]

" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1

"Cycle autocomplete with control+j,k
inoremap <expr> <c-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <c-k> ((pumvisible())?("\<C-p>"):("k"))

" Always show powerline
set laststatus=2

"latex pdf viewer
"let g:vimtex_vew_general_viewer = "zathura"
let g:vimtex_view_method = "zathura"

"Tagbar settings
let g:tagbar_left=1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let tagbar_map_showproto="gi"
j

"include dictionaries for file types
autocmd FileType * exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/SNIPPETS/".expand('<amatch>'))
autocmd FileType * exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/".expand('<amatch>'))
set completeopt=menuone,longest,preview
set complete+=k

"neocomplete settings
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'tex' : '~/.vim/dictionaries/tex,~/.vim/dictionaries/tex_slash',
\ }

"debugging with syntastic
let g:syntastic_always_populate_loc_list = 1

let g:Powerline_symbols = 'fancy'
"-----------------------------------------------------------
"Editor settings
"-----------------------------------------------------------
syntax enable
set relativenumber
set number "line numbers
set showcmd "cmd at bottom
set incsearch "search as characters are entered
set showmatch "highlight matching brackets
set wildmenu "visual autocomplete for commands
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase "search not case sensitive
set smartcase "search case sensitive if caps used
set splitbelow 
set splitright
set wrap linebreak
set undodir=~/.vim/undodir "save undo files here"
set undofile "keep undo history between sessions"
"filetype plugin on

set t_Co=256
colorscheme srcery-drk
highlight Pmenu ctermbg=red "change completion menu colors
highlight PmenuSel ctermbg=gray 
"-----------------------------------------------------------
"Key bindings
"-----------------------------------------------------------
"back/forth buffers
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
nnoremap <leader>q :bdelete<CR>

"scrolling
nnoremap J <c-d> 
vnoremap J <c-d> 
nnoremap K <c-u>
vnoremap K <c-u>

"copying, use global
nnoremap yy "+yy
vnoremap y "+y
nnoremap Y "+y$

"pasting - <insert> paste quickly rather than line by line
nnoremap <insert> "*p

"jump backwards/forwards
nnoremap H <c-O>
nnoremap L <tab>

nnoremap <c-i> :execute "tab h " . expand("<cword>")<cr>

nnoremap <leader>t :TagbarToggle<cr>s
nnoremap <leader>n :NERDTreeToggle<cr>
"nnoremap <leader>r :QuickRun<cr>
nnoremap <leader>r :!python3 %<cr>

"split commands
"switching
"nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
"nnoremap <leader>l <c-w>l
nnoremap <leader>w <c-w>w
"resizing
nnoremap <leader>s <c-w>=

noremap <leader>d :lopen<cr>

"jumpt to <+> in templates and enter insert mode
nnoremap <leader><tab> /<+><cr>vf>c

"file templates
autocmd BufNewFile *.c 0r ~/.vim/templates/c_template.c
autocmd BufNewFile *.py 0r ~/.vim/templates/python_template.py
"
"vimtex needs tex file wrote to start tex compiler mode
"au BufReadPost,BufNewFile *.md,*.txt,*.tex set tw=80
"au BufReadPost,BufNewFile *.tex colorscheme badwolf
autocmd BufNewFile *.tex :write
autocmd BufNewFile *.tex 0r ~/.vim/templates/tex_template.tex
autocmd BufNewFile *print.tex 0r ~/.vim/templates/tex_print_template.tex
let g:tex_flavor='latex'
