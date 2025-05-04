return {
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
}
