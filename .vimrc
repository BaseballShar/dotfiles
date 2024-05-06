" System settings
filetype plugin on
filetype indent on
syntax on
" set shell=zsh
set history=1000
set termguicolors " Enable 24 bit colors
set timeoutlen=300 " Wait time for key combo

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

" Switch between buffers
nnoremap <silent> <S-h> :bp<CR>
nnoremap <silent> <S-l> :bn<CR>

" Open file explorer in a split screen
nnoremap <silent> <Space>e :NERDTreeToggle<CR>

" Move lines up and down
" ESC maps to ALT in mac
nnoremap <silent> <ESC>j :m+1<CR>
nnoremap <silent> <ESC>k :m-2<CR>
vnoremap <silent> <ESC>j :m'>+1<CR>gv
vnoremap <silent> <ESC>k :m'<-2<CR>gv

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
nnoremap <silent> <Space>w :w<CR>

" No search highlighting
nnoremap <silent> <Space>h :noh<CR>

" Set leader key to space
let maplocalleader = " "

" Plugins
call plug#begin()

" Autopairs
Plug 'jiangmiao/auto-pairs'

" todo LIST
Plug 'aserebryakov/vim-todo-lists'

" latexify vim
Plug 'lervag/vimtex', { 'tag': 'v2.13' }

" Smooth scrolling
Plug 'psliwka/vim-smoothie'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets!
" Plug 'honza/vim-snippets'

" Wine Linter
Plug 'w0rp/ale'

" Autoformatters!
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
" Handle haskell formatting
Plug 'sdiehl/vim-ormolu'

" Ask copilot to work for me
Plug 'github/copilot.vim'

" A nice organic theme
Plug 'sainnhe/everforest'

" A fabulous syntax highlighter, autoindenter for all languages
Plug 'sheerun/vim-polyglot'

" A nice status bar and buffer line for vim
Plug 'ap/vim-buftabline'

" A nerdy file explorer
Plug 'preservim/nerdtree', { 'tag': '7.1.1'}
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ryanoasis/vim-devicons'

" A nice code commenter
Plug 'tpope/vim-commentary', { 'tag': 'v1.3'}

" Bringing fzf to vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" You are surrounded!
Plug 'tpope/vim-surround'

call plug#end()

colorscheme everforest

call glaive#Install()

" Plugin setting
nnoremap <silent> <Space>pi :PlugInstall<CR>
nnoremap <silent> <Space>pu :PlugUpdate<CR>
nnoremap <silent> <Space>pc :PlugClean<CR>

augroup autoformat_settings
  autocmd BufRead * NoAutoFormatBuffer
  autocmd FileType c,cpp AutoFormatBuffer clang-format
  autocmd FileType fish AutoFormatBuffer fish_indent
  autocmd FileType haskell nnoremap <silent> <buffer> <Space>f :call RunOrmolu()<CR>
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType html,css,sass,scss,less,json,jsonc,javascript,typescript,markdown AutoFormatBuffer prettier
  autocmd FileType lua AutoFormatBuffer luaformatterfiveone
  autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType tex nnoremap <silent> <buffer> <Space>f :%!latexindent-macos<CR>
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

" vimtex options
" Disable auto popup of quickfix window
let g:vimtex_quickfix_mode = 0
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
" Value 1 allows forward search after every successful compilation
let g:vimtex_view_skim_sync=1
" Value 1 allows change focus to skim after command `:VimtexView` is given
let g:vimtex_view_skim_activate=1
autocmd FileType tex nnoremap <silent> <buffer> <Space>lt :VimtexTocToggle<CR>

" ormolu flags
let g:ormolu_options=["--no-cabal"]
let g:ormolu_disable=1

" copilot
let g:copilot_assume_mapped = v:true
let g:copilot_no_tab_map = v:true
inoremap <silent><script><expr> <C-J> copilot#Accept("")
inoremap <silent> <C-L> <Plug>(copilot-accept-line)
inoremap <silent> <C-W> <Plug>(copilot-accept-word)

" vim-airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='deus'
" let g:airline#extensions#branch#enabled = 1

" NerdTree
let g:nerdtree_vis_confirm_open = 0

" codefmt
nnoremap <silent> <Space>f :FormatCode<CR>

" ale
let g:ale_completion_enabled = 1

" coc
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <Space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <Space>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <Space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <Space>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <Space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <Space>cj  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <Space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <Space>cp  :<C-u>CocListResume<CR>
