return {
  -- excellent formatter that won't make you dizzy
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    local format_enabled = true
    local disabled_fts = { "ruby", "eruby", "yaml", "css", "scss" }

    -- link formatters to filetypes
    conform.setup({
      formatters_by_ft = {
        css = { "prettier" },
        go = { "gofmt" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        python = { "autopep8" },
        rust = { "rustfmt" },
        swift = { "swift_format" },
        toml = { "taplo" },
        typst = { "typstyle" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        ruby = { "rufo" },
        eruby = { "erb_format" },
      },
      range = { conform.range },
      -- auto format on save
      format_on_save = function(bufnr)
        if not format_enabled then
          return false -- disables formatting on save
        end
        -- enables formatting on save
        return { timeout_ms = 500 }
      end,
    })

    -- Configure formatter arguments
    conform.formatters.stylua = {
      prepend_args = {
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
        "--column-width",
        "80",
      },
    }

    local function toggle_formatting()
      format_enabled = not format_enabled
      if format_enabled then
        print("Form on save enabled")
      else
        print("Form on save disabled")
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = disabled_fts,
      callback = function()
        format_enabled = false
      end,
    })

    -- Uncomment if want to manually format
    vim.keymap.set("n", "<Leader>cf", conform.format)
    vim.keymap.set("v", "<Leader>cf", conform.format)
    vim.keymap.set(
      "n",
      "<Leader>tf",
      toggle_formatting,
      { desc = "Toggle format on save" }
    )
  end,
}
