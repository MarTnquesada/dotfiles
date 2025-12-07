-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Set up LSP keybindings when LSP attaches to buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }

          -- Navigation
          opts.desc = "Go to Declaration"
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          opts.desc = "Go to Definition"
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          opts.desc = "Go to Implementation"
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          opts.desc = "Go to References"
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          opts.desc = "Go to Type Definition"
          vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

          -- Documentation
          opts.desc = "Hover Documentation"
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          opts.desc = "Signature Help"
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

          -- Code actions
          opts.desc = "Code Action"
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          opts.desc = "Rename"
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          opts.desc = "Format Document"
          vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format { async = true }
          end, opts)

          -- Diagnostics
          opts.desc = "Show Line Diagnostics"
          vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, opts)
          opts.desc = "Go to Previous Diagnostic"
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
          opts.desc = "Go to Next Diagnostic"
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
          opts.desc = "Show Diagnostics in Location List"
          vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, opts)

          -- Inlay hints (delayed because they need to wait for LSP, otherwise they don't show)
          vim.defer_fn(function()
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
          end, 5000)

          opts.desc = "Toggle inlay hints"
          vim.keymap.set('n', '<leader>ih', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
          end, opts)
        end,
      })
      vim.lsp.config('pylsp', {
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                enabled = false,
              },
            },
          },
        },
      })
      vim.lsp.config('basedpyright', {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "basic",
            },
          },
        },
      })
    end,
  },
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup() -- This is also in charge of auto enabling all installed servers, if removed use vim.lsp.enable
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- NB: These will FAIL if you don't have the language toolchains installed!
        -- NB: Make sure to add more from this list!
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
        ensure_installed = { "ruff", "eslint", "rust_analyzer", "lua_ls" }
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        format_on_save = { -- Auto-format everything, use LSP when no explicit conform formatter is set
          timeout_ms = 2000,
          lsp_fallback = true,
        },
        default_format_opts = { lsp_format = "fallback" },
        formatters_by_ft = {
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          json = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          -- sql = { "pg_format" },
        },
      })
    end,
  },
}
