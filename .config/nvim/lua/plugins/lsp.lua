local keymap = vim.keymap.set
local lsp_servers = {
  "bashls",
  "cssls",
  "emmet_language_server",
  "eslint",
  "html",
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "tailwindcss",
  "texlab",
  "tinymist",
  "ts_ls",
  "vimls",
  -- "solargraph",
  "ruby_lsp",
  "htmx",
  -- "intelephense",
  "phpactor",
  "stylelint_lsp",
}

return {
  -- Mason the medieval lsp gather
  {
    "williamboman/mason.nvim",
    version = "^1",
    opts = {},
  },

  -- Mason lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    version = "^1",
    opts = {
      ensure_installed = lsp_servers,
    },
  },

  -- nvim lspconfig
  {
    "neovim/nvim-lspconfig",
    version = "^1",
    config = function()
      local lspconfig = require("lspconfig")
      -- default binding
      for _, server in ipairs(lsp_servers) do
        lspconfig[server].setup({})
      end

      -- additional configs
      lspconfig.bashls.setup({
        filetypes = { "sh", "bash", "zsh" },
      })

      lspconfig.sourcekit.setup({
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      })

      lspconfig.html.setup({
        filetypes = { "html", "eruby" },
      })

      lspconfig.emmet_language_server.setup({
        filetypes = { "javascript", "html", "eruby", "php" },
      })

      local builtin = require("telescope.builtin")
      keymap("n", "<Leader>k", ":LspInfo<CR>")
      keymap("n", "K", vim.lsp.buf.hover)
      keymap("n", "gd", vim.lsp.buf.definition)
      keymap("n", "gr", vim.lsp.buf.references)
      keymap("n", "gi", vim.lsp.buf.implementation)
      -- keymap("n", "gd", builtin.lsp_definitions)
      -- keymap("n", "gr", builtin.lsp_references)
      -- keymap("n", "gi", builtin.lsp_implementations)
      keymap("n", "<Leader>ds", builtin.lsp_document_symbols)
      keymap("n", "<Leader>ws", builtin.lsp_dynamic_workspace_symbols)
      keymap("n", "<Leader>rn", vim.lsp.buf.rename)
      keymap("n", "<Leader>ca", vim.lsp.buf.code_action)
      keymap(
        "n",
        "<Leader>ts",
        builtin.treesitter,
        { desc = "Open treesitter symbols" }
      )
      keymap("i", "<A-s>", vim.lsp.buf.signature_help)

      -- Disable builtin lsp mapping conflicting with goto refs
      vim.keymap.del("n", "grr")
      vim.keymap.del("n", "gra")
      vim.keymap.del("n", "gri")
      vim.keymap.del("n", "grn")

      -- Diagonstics
      -- Toggle diagonstics on and off
      local function toggle_diagnostic()
        if vim.diagnostic.is_enabled() then
          vim.diagnostic.enable(false)
          print("LSP Diagonstics Disabled")
        else
          vim.diagnostic.enable()
          print("LSP Diagonstics Enabled")
        end
      end

      vim.keymap.set(
        "n",
        "<Leader>ti",
        toggle_diagnostic,
        { desc = "Toggle diagnostic" }
      )
      keymap("n", "]d", vim.diagnostic.goto_next)
      keymap("n", "[d", vim.diagnostic.goto_prev)
    end,
  },

  -- Snippet plugins
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<A-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-k>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- Set up vim-dadbod for sql files
      cmp.setup.filetype({ "sql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })

      -- Set up lspconfig.
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      for _, server in ipairs(lsp_servers) do
        require("lspconfig")[server].setup({
          capabilities = capabilities,
        })
      end
      -- Setup swift completion
      require("lspconfig").sourcekit.setup({
        capabilities = capabilities,
      })
    end,
  },
  "saadparwaiz1/cmp_luasnip",

  -- Comments all the way
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup({
        pre_hook = require(
          "ts_context_commentstring.integrations.comment_nvim"
        ).create_pre_hook(),
      })
    end,
  },

  -- Comments in jsx
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    config = function()
      require("ts_context_commentstring").setup()
    end,
  },

  -- Treesitter oxygenates your language parsers
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- Huge and colourful tree!
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "html",
          "javascript",
          "lua",
          "python",
          "typescript",
          "vim",
        },
        -- Avoid conflicts with vimtex
        ignore_install = { "latex" },
        auto_install = true,
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
      })
    end,
  },

  -- Treesitter textobjects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            },
          },
        },
        matchup = {
          enable = true,
        },
      })
    end,
  },
}
