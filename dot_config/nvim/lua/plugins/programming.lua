return {
	-- Include the json config from LazyVim
	{ import = "lazyvim.plugins.extras.lang.json" },

	-- DAP
	{ import = "lazyvim.plugins.extras.dap.core" },
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			ensure_installed = { "delve" },
		},
	},

	-- Github Copilot
	-- { import = "lazyvim.plugins.extras.coding.copilot" },

  -- none-ls handy things
  {
    import = "lazyvim.plugins.extras.lsp.none-ls",
    opts = function()
      local nls = require("none-ls")
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
	-- Todo comments (for filtering)
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
          "--iglob",
          "'!vendor/'"
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				pattern = [[\b(KEYWORDS):]], -- ripgrep regex
				-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
			},
		},
	},

	-- Puppet
	"rodjek/vim-puppet",

	-- Add LSP Config Servers to Install
	{
		"neovim/nvim-lspconfig",
		opts = {
			autoformat = false,
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
				"mypy",
			},
		},
	},
}
