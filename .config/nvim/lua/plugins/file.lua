return {
  -- Breathable air for nvim
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<Leader>e", "<Cmd>Neotree toggle<CR>", desc = "File tree" },
    },
    opts = {},
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
