return {
  -- Include the json config from LazyVim
  { import = "lazyvim.plugins.extras.lang.json" },

  -- Add LSP Config Servers to Install
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {},
        bashls = {},
        cssls = {},
        docker_compose_language_service = {},
        dockerls = {},
        gopls = {},
        groovyls = {},
        marksman = {},
        pylsp = {
          plugins = {
            autopep8 = {
              enabled = false,
            },
            pycodestyle = {
              enabled = false,
            },
            mccabe = {
              enabled = false,
            },
            pyflakes = {
              enabled = false,
            },
          },
        },
        terraformls = {},
        tflint = {},
        yamlls = {},
        zk = {},
      },
    },
  },

  -- Install tool with Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "black",
        "pylint",
        "golines",
        "golangci-lint",
      },
    },
  },

  -- null-ls handy things
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.formatting.shfmt.with({
            extra_args = { "-i", "2", "-ci" },
          }),
          nls.builtins.diagnostics.mypy,
          nls.builtins.diagnostics.pylint.with({
            extra_args = { "--max-line-length", "120" },
          }),
          nls.builtins.formatting.black.with({
            extra_args = { "-l", "120" },
          }),
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.golines,
          nls.builtins.diagnostics.golangci_lint,
          nls.builtins.code_actions.gitsigns,
        },
      }
    end,
  },
}
