return {
  -- Add surrounding delimiters for text objects
  "tpope/vim-surround",

  -- An array of useful mini features
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.starter").setup({
        header = "Welcome Fisher Baseball\nTime for some bruh work!",
      })
      -- require("mini.ai").setup()
      require("mini.jump").setup({
        delay = {
          idle_stop = 1000,
        },
      })
    end,
  },

  -- Treesitter textobjects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            },
          },
        },
        matchup = {
          enable = true,
        },
      })
    end,
  },

  -- Auto close pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- LaTeX >>> Word
  {
    "lervag/vimtex",
    version = "~2.15",
    lazy = false,
    config = function()
      -- Disable auto popup of quickfix window
      vim.g.vimtex_quickfix_mode = 0
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "skim"
      -- Value 1 allows forward search after every successful compilation
      vim.g.vimtex_view_skim_sync = 1
      -- Value 1 allows chanvim.ge focus to skim after command `.VimtexView` is given
      vim.g.vimtex_view_skim_activate = 1
      vim.cmd(
        "autocmd FileType tex nnoremap <silent> <buffer> <Space>lt :VimtexTocToggle<CR>"
      )
    end,
  },

  -- Jump to everywhere within 4 strokes
  {
    "ggandor/leap.nvim",
    -- Lazy load on pressing s or gs
    keys = {
      { "s", "<Plug>(leap)" },
      { "gs", "<Plug>(leap-from-window)" },
    },
  },

  -- Handy bracket actions
  {
    "tpope/vim-unimpaired",
    event = "VeryLazy",
  },

  -- Navigate to matching pairs
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Instant preview for typst
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    opts = {
      dependencies_bin = {
        ["tinymist"] = "tinymist",
      },
    },
    keys = {
      { "<Leader>ll", "<Cmd>TypstPreview<CR>" },
    },
  },
}
