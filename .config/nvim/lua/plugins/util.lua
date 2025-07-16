local keymap = vim.keymap.set

return {
  -- Terminal integration plugins
  "christoomey/vim-tmux-navigator",

  -- Auto-disable hightlight after moving on
  "romainl/vim-cool",

  -- Offers indent guide
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        scope = { enabled = false },
      })
    end,
  },

  -- Shows sign columns and hunk text objects
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, { desc = "Next hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, { desc = "Prev hunk" })

        -- Actions
        map("n", "<Leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
        map("n", "<Leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
        map("v", "<Leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Stage hunk" })
        map("v", "<Leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Reset hunk" })
        map("n", "<Leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
        map(
          "n",
          "<Leader>hu",
          gitsigns.undo_stage_hunk,
          { desc = "Undo stage hunk" }
        )
        map("n", "<Leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
        map("n", "<Leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
        map("n", "<Leader>hb", function()
          gitsigns.blame_line({ full = true })
        end, { desc = "Blame line" })
        map(
          "n",
          "<Leader>tb",
          gitsigns.toggle_current_line_blame,
          { desc = "Toggle current line blame" }
        )
        map("n", "<Leader>hd", gitsigns.diffthis, { desc = "Diff this" })
        map("n", "<Leader>hD", function()
          gitsigns.diffthis("~")
        end, { desc = "Diff last commit" })
        map(
          "n",
          "<Leader>td",
          gitsigns.toggle_deleted,
          { desc = "Toggle deleted lines" }
        )

        -- Text object
        map(
          { "o", "x" },
          "ih",
          ":<C-U>Gitsigns select_hunk<CR>",
          { desc = "Select hunk" }
        )
      end,
    },
  },

  -- A Terminal inside a vim run by another terminal
  {
    "akinsho/toggleterm.nvim",
    version = "^2",
    keys = "<A-q>",
    config = function()
      require("toggleterm").setup({
        size = 15,
        direction = "float",
        open_mapping = [[<A-q>]],
      })
    end,
  },

  {
    "vimwiki/vimwiki",
    keys = "<Leader>ww",
    ft = { "markdown", "vimwiki" },
    init = function()
      vim.g.vimwiki_list = { { syntax = "markdown", ext = "md" } }
    end,
    config = function()
      keymap({ "n", "v" }, "<A-t>", "<Plug>VimwikiToggleListItem")
    end,
  },

  -- Repeat everything
  "tpope/vim-repeat",

  -- Git integration
  {
    "tpope/vim-fugitive",
    config = function()
      keymap("n", "<Leader>ga", "<Cmd>G<CR>")
    end,
  },

  -- Very bright and shiny TODO!!!
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- opts = {},
    config = function()
      require("todo-comments").setup()
      keymap("n", "<Leader>gt", "<Cmd>TodoTelescope<CR>")
    end,
  },

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
      { "<Leader>ll", "<Cmd>TypstPreview<CR>", desc = "Preview typst" },
    },
  },

  -- Smooth like oil, vesatile like oil
  {
    "stevearc/oil.nvim",
    keys = {
      { "-", "<Cmd>Oil<CR>" },
    },
    opts = {
      keymaps = {
        ["h"] = "actions.parent",
        ["l"] = "actions.select",
      },
    },
  },
}
