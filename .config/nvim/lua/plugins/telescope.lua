local keymap = vim.keymap.set
local opts = { silent = true }

return {
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            theme = "dropdown",
          },
          grep_string = {
            search = "",
          },
        },
      })
      local builtin = require("telescope.builtin")
      keymap("n", "<Leader>f", builtin.find_files)
      keymap("n", "<Leader>b", builtin.buffers)
      keymap("n", "<Leader>/", builtin.grep_string)
      keymap("n", "<Leader><Leader>", builtin.current_buffer_fuzzy_find)
      keymap("n", "<Leader>gc", builtin.commands)
      keymap("n", "<Leader>gm", builtin.marks)
      keymap("n", "<Leader>gh", builtin.oldfiles)
      keymap("n", "<Leader>gr", builtin.registers)
      keymap("n", "<Leader>gk", builtin.keymaps)
      keymap("n", "<Leader>gd", builtin.diagnostics)
    end,
  },

  -- Telescope ui select
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      telescope.load_extension("ui-select")
    end,
  },

  -- fzf integration
  {
    "junegunn/fzf",
    build = function()
      vim.cmd("call fzf#install()")
    end,
  },

  {
    "junegunn/fzf.vim",
    config = function()
      vim.api.nvim_create_user_command("LinesMulti", function()
        vim.fn["fzf#vim#lines"]("", {
          options = "--multi --bind=ctrl-a:select-all,ctrl-q:accept",
        })
      end, {})
      keymap("n", "<Leader>gf", ":LinesMulti<CR>", opts)

      vim.api.nvim_create_user_command("Goto", function(options)
        -- try use first arg as keyword, if empty use clipboard
        local keyword = options.args
        if keyword == nil or keyword == "" then
          keyword = vim.fn.getreg("*")
        end

        local rg_cmd = "rg -li " .. vim.fn.shellescape(keyword)
        local spec = {
          source = rg_cmd,
          options = "--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all",
          ["sink*"] = function(lines)
            if not lines or vim.tbl_isempty(lines) then
              return
            end
            for _, file in ipairs(lines) do
              vim.cmd("edit " .. vim.fn.fnameescape(file))
            end
          end,
        }

        vim.fn["fzf#run"](vim.fn["fzf#wrap"](spec))
      end, { nargs = "?" })
      keymap("n", "<Leader>gt", ":Goto<CR>", opts)
    end,
  },

  -- fzf to telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
}
