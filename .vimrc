" System settings
filetype plugin on
filetype indent on
syntax on
set history=1000
set termguicolors " Enable 24 bit colors
set background=dark
set timeoutlen=300 " Wait time for key combo

" Render cursor as bar in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Display options
set nocompatible " Use Vim instead of Vi
set number relativenumber
set ruler
set showcmd
set cursorline
set linebreak " Avoid wrapping words
set splitbelow " Open split window below
set scrolloff=5 " Leave some lines above and below the cursor

" Tab and indentation
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab

" Searching
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" Use system clipboard when copying
set clipboard=unnamedplus
set clipboard+=unnamed

" Fuzzy file search & Auto completion
set path+=**
set wildmenu
set wildmode=list:full

" Folding
set foldmethod=indent
set nofoldenable

" Buffers
set autoread " Auto read changed files

" Statusline
set laststatus=2
set statusline=\ 
set statusline+=%4f\ " File name
set statusline+=%m " Modified
set statusline+=%= " Push to right
set statusline+=%l:%-4c " Line number and character

" Center after moving pages
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-f> <C-f>zz
nnoremap <silent> <C-b> <C-b>zz

" Exit to normal mode quickly
inoremap jk <ESC>
inoremap kj <ESC>

" Quit and save easily
nnoremap <silent> <Space>q :q<CR>
nnoremap <silent> <Space>s :w<CR>

let maplocalleader = " "
let mapleader = " "

" Plugins
call plug#begin()

" A nice organic theme
Plug 'sainnhe/everforest'

" Auto disable search hightlight
Plug 'romainl/vim-cool'

" Vimwiki
Plug 'vimwiki/vimwiki'

call plug#end()

colorscheme everforest

" Use markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]

nnoremap <Leader>t <Plug>VimwikiToggleListItem
