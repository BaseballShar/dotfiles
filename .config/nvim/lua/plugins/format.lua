return {
  -- Excellent formatter that won't make you dizzy
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    -- Link formatters to filetypes
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
        bash = { "shfmt" },
        zsh = { "shfmt" },
      },
      range = { conform.Range },
      -- Auto format on save
      format_on_save = {
        timeout_ms = 500,
      },
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

    -- Uncomment if want to manually format
    vim.keymap.set("n", "<Leader>cf", conform.format)
    vim.keymap.set("v", "<Leader>cf", conform.format)
  end,
}
