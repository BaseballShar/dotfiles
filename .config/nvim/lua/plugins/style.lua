return {
  -- Colorschemes
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme everforest")
      vim.cmd("autocmd FileType vifm set ft=vim")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "EdenEast/nightfox.nvim",
  "navarasu/onedark.nvim",
  "rebelot/kanagawa.nvim",
  "sainnhe/gruvbox-material",

  -- A Nice and highly customisible statusline for vim
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_b = { "filename" },
        lualine_c = {},
        lualine_x = { "diagnostics" },
        lualine_y = { "diff", "branch" },
        lualine_z = { "location" },
      },
      options = {
        component_separators = "",
      },
    },
  },

  -- This highlights colours
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      render = "virtual",
    },
  },
}
