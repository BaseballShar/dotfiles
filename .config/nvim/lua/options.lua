-- Set leader key to space
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- General settings
vim.opt.history = 1000
vim.opt.termguicolors = true -- Enable 24 bit colors
vim.opt.timeoutlen = 500 -- Wait time for key combo
vim.opt.updatetime = 300 -- Faster completion
vim.opt.signcolumn = "yes" -- Show useful signs next to line numbers

-- Display options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.linebreak = true -- Avoid wrapping words
vim.opt.splitbelow = true -- Open split window below
vim.opt.scrolloff = 2 -- Leave some lines above and below the cursor

-- Tab and indentation
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use system clipboard when copying
vim.opt.clipboard:append("unnamedplus")
vim.opt.clipboard:append("unnamed")

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false

vim.diagnostic.config({ virtual_text = { current_line = true } })
