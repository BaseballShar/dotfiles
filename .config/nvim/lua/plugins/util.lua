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
        end)

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end)

        -- Actions
        map("n", "<Leader>hs", gitsigns.stage_hunk)
        map("n", "<Leader>hr", gitsigns.reset_hunk)
        map("v", "<Leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("v", "<Leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("n", "<Leader>hS", gitsigns.stage_buffer)
        map("n", "<Leader>hu", gitsigns.undo_stage_hunk)
        map("n", "<Leader>hR", gitsigns.reset_buffer)
        map("n", "<Leader>hp", gitsigns.preview_hunk)
        map("n", "<Leader>hb", function()
          gitsigns.blame_line({ full = true })
        end)
        map("n", "<Leader>tb", gitsigns.toggle_current_line_blame)
        map("n", "<Leader>hd", gitsigns.diffthis)
        map("n", "<Leader>hD", function()
          gitsigns.diffthis("~")
        end)
        map("n", "<Leader>td", gitsigns.toggle_deleted)

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    },
  },

  -- A Terminal inside a vim run by another terminal
  {
    "akinsho/toggleterm.nvim",
    version = "^2",
    keys = "<A-1>",
    config = function()
      require("toggleterm").setup({
        size = 15,
        direction = "float",
        open_mapping = [[<A-1>]],
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

  -- Show hex code as colours
  {
    "rrethy/vim-hexokinase",
    build = "make hexokinase",
    init = function()
      vim.g.Hexokinase_highlighters = { "virtual" }
      vim.g.Hexokinase_optInPatterns = { "full_hex" }
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
}
