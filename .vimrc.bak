" System settings
filetype plugin on
filetype indent on
syntax on
" set shell=zsh
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

" Inspired by helix
" Better intraline movement
nnoremap <silent> gh _
vnoremap <silent> gh _
nnoremap <silent> gl $
vnoremap <silent> gl $

" U for redo, <C-r> for line restore
nnoremap <silent> U <C-r>
nnoremap <silent> <C-r> U

" Allow small jumps in insert mode
inoremap <C-e> <Esc>wa
inoremap <C-b> <Esc>bi

" Center after moving pages
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz
nnoremap <silent> <C-f> <C-f>zz
nnoremap <silent> <C-b> <C-b>zz

" Switch between buffers
nnoremap <silent> <S-h> :bp<CR>
nnoremap <silent> <S-l> :bn<CR>

" Move lines up and down
" ESC maps to ALT in mac
nnoremap <silent> <A-j> :m+1<CR>
nnoremap <silent> <A-k> :m-2<CR>
vnoremap <silent> <A-j> :m'>+1<CR>gv
vnoremap <silent> <A-k> :m'<-2<CR>gv

" Inserting a line of space ,ignoring comments
nnoremap <silent> <Space>o o<Esc>S<Esc>k
nnoremap <silent> <Space>O O<Esc>S<Esc>j

" Exit to normal mode quickly
inoremap jk <ESC>
inoremap kj <ESC>

" Buffer management
nnoremap <silent> <Space>d :bd<CR>

" Change windows easily
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k

" Quit and save easily
nnoremap <silent> <Space>q :q<CR>
nnoremap <silent> <Space>s :w<CR>

" Quick move bindings
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [q :cprev<CR>
nnoremap <silent> ]Q :clast<CR>
nnoremap <silent> [Q :cfirst<CR>

" Set leader key to space
let maplocalleader = " "

" Plugins
call plug#begin()

" A nice organic theme
Plug 'sainnhe/everforest'

" A fabulous syntax highlighter, autoindenter for all languages
Plug 'sheerun/vim-polyglot'

" A nice code commenter
Plug 'tpope/vim-commentary', { 'tag': 'v1.3'}

" You are surrounded!
Plug 'tpope/vim-surround'

" A simple status line
Plug 'vim-airline/vim-airline'

" Auto disable search hightlight
Plug 'romainl/vim-cool'

call plug#end()

colorscheme everforest

" Plugin setting
" Vim-airline
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create(['%4l:%-3c'])

" Plugin manager
nnoremap <silent> <Space>pi :PlugInstall<CR>
nnoremap <silent> <Space>pu :PlugUpdate<CR>
nnoremap <silent> <Space>pc :PlugClean<CR>
