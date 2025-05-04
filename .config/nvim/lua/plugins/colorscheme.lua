return {
  -- Colorscheme
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
}
