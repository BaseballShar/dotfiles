return {
  -- LuaSnip engine
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "r5n-dev/vscode-react-javascript-snippets",
    },
    config = function()
      local ls = require("luasnip")
      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        ls.jump(1)
      end, { silent = true })

      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").load({
        paths = "~/.config/nvim/snippets",
      })
    end,
  },

  -- React snippets
  {
    "r5n-dev/vscode-react-javascript-snippets",
    build = "yarn install --frozen-lockfile && yarn compile",
  },
}
