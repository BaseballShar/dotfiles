-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
local opts = { noremap = true, silent = true }
lvim.colorscheme = "everforest"

vim.opt.shiftwidth = 2 -- Size of tab
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.timeoutlen = 200
vim.opt.mouse = ''

-- vim.api.nvim_set_var("maplocalleader", ",")
vim.g.copilot_assume_mapped = true
vim.cmd('imap <silent><script><expr> <S-CR> copilot#Accept("")')
vim.g.copilot_no_tab_map = true

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)

vim.keymap.set("v", "jk", "<ESC>", opts)
vim.keymap.set("v", "kj", "<ESC>", opts)

-- Autocommands
-- Run prettier on save
-- vim.cmd("autocmd BufWritePre *.js,*.css Prettier")
-- Format Haskell on save
-- vim.cmd("autocmd BufWritePre *.hs %!stylish-haskell")

-- Setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup { { name = "black" }, }
lvim.format_on_save.enabled = true

-- Setup linting
local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup { { command = "flake8", filetypes = { "python" } } }

-- Plugins
lvim.plugins = {
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
  },

  -- Latex
  {
    "lervag/vimtex",
    version = "v2.14",
    lazy = false
  },

  -- Vim surround
  { "tpope/vim-surround" },

  -- Vim to-do list
  { "aserebryakov/vim-todo-lists" },

  -- Github copilot
  { "github/copilot.vim" },

  -- Prettier
  {
    "prettier/vim-prettier",
    build = "yarn install --frozen-lockfile --production"
  },
  {
    'dsznajder/vscode-es7-javascript-react-snippets',
    build = 'yarn install --frozen-lockfile && yarn compile'
  },

  -- Haskell colouring and autoindent
  -- { "neovimhaskell/haskell-vim" },
}
