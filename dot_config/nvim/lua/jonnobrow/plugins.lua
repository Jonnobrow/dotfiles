local function setup(plugfn)
	-- Bootstrap Packer
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd("packadd packer.nvim")
	end
	vim.cmd([[packadd packer.nvim]])
	-- vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes in plugins.lua
	vim.cmd([[
      augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
      augroup end
    ]])
	vim.cmd([[
        augroup chezmoi_auto_readd
            autocmd!
            autocmd BufWritePost ~/.config/nvim/* ! chezmoi re-add ~/.config/nvim/
            autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
        augroup end
    ]])
	-- Install Plugins
	local packer = require("packer")
	return packer.startup(plugfn)
end

local function plugins(use)
	-- Package Manager
	use({ "wbthomason/packer.nvim", opt = true })

	-- Faster Filetype Plugin
	use({ "nathom/filetype.nvim" })

	-- Improvements to basic ui components
	use({ "stevearc/dressing.nvim", event = "BufReadPre" })

	-- Better buffer management
	use({ "kazhala/close-buffers.nvim", cmd = "BDelete" })

	-- Terminal
	use({
		"norcalli/nvim-terminal.lua",
		ft = "terminal",
		config = function()
			require("terminal").setup()
		end,
	})
	use({
		"akinsho/nvim-toggleterm.lua",
		keys = "<M-`>",
		config = function()
			require("jonnobrow.terminal")
		end,
	})

	-- Theme: icons
	use({
		"kyazdani42/nvim-web-devicons",
		module = "nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({ default = true })
		end,
	})

	-- Theme: colour scheme
	use({
		"folke/tokyonight.nvim",
		config = function()
			require("jonnobrow.theme")
		end,
	})

	-- Highlight colour codes with the colour
	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require("jonnobrow.colorizer")
		end,
	})

	-- Dashboard
	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("jonnobrow.dashboard")
		end,
	})

	-- Core Dependencies
	use({ "nvim-lua/plenary.nvim", module = "plenary" })
	use({ "nvim-lua/popup.nvim", module = "popup" })

	-- Fuzzy Finder / Search
	use({
		"nvim-telescope/telescope.nvim",
		opt = true,
		config = function()
			require("jonnobrow.telescope")
		end,
		cmd = { "Telescope" },
		module = "telescope",
		wants = {
			"plenary.nvim",
			"popup.nvim",
			"telescope-fzf-native.nvim",
			"telescope-project.nvim",
			"telescope-dap.nvim",
			"telescope-symbols.nvim",
			"trouble.nvim",
		},
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			},
		},
	})

	-- Indent Guides and rainbow brackets
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = function()
			--require("config.blankline")
		end,
	})

	-- Tabs
	use({
		"akinsho/nvim-bufferline.lua",
		event = "BufReadPre",
		wants = "nvim-web-devicons",
		config = function()
			require("jonnobrow.bufferline")
		end,
	})

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "rlch/github-notifications.nvim" },
		event = "VimEnter",
		config = function()
			require("jonnobrow.lualine")
		end,
		wants = "nvim-web-devicons",
	})

	-- Markdown Preview in Neovim
	use({ "npxbr/glow.nvim", cmd = "Glow" })

	-- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
	use({
		"folke/trouble.nvim",
		event = "BufReadPre",
		wants = "nvim-web-devicons",
		cmd = { "Trouble", "TroubleToggle" },
		config = function()
			require("trouble").setup({})
		end,
	})

	-- Session Persistence
	use({
		"folke/persistence.nvim",
		event = "BufReadPre",
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
		after = "nvim-lspconfig",
	})

	-- Highlighting and more for TODO comments
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = "BufReadPost",
		config = function()
			require("todo-comments").setup()
		end,
	})

	-- Keybindings
	use({
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("jonnobrow.keys")
		end,
	})

	-- Show Location in File using Treesitter
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
		wants = "nvim-treesitter",
		module = "nvim-gps",
		config = function()
			require("nvim-gps").setup({ separator = " " })
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		opt = true,
		event = "BufRead",
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
		},
		config = function()
			require("jonnobrow.treesitter")
		end,
	})

	-- Better notifications
	use({
		"rcarriga/nvim-notify",
		event = "VimEnter",
		config = function()
			vim.notify = require("notify")
		end,
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		opt = true,
		event = "BufReadPre",
		wants = {
			"null-ls.nvim",
			"lua-dev.nvim",
			"cmp-nvim-lsp",
			"nvim-lsp-installer",
		},
		config = function()
			require("jonnobrow.lsp")
		end,
		requires = {
			"jose-elias-alvarez/null-ls.nvim",
			"folke/lua-dev.nvim",
			"williamboman/nvim-lsp-installer",
			"b0o/SchemaStore.nvim",
		},
	})

	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({
				bind = true,
				handler_opts = {
					border = "rounded",
				},
			})
		end,
		after = "nvim-lspconfig",
	})

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		opt = true,
		config = function()
			require("jonnobrow.compe")
		end,
		wants = { "LuaSnip" },
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				wants = "friendly-snippets",
				config = function()
					require("jonnobrow.snippets")
				end,
			},
			"rafamadriz/friendly-snippets",
			{
				module = "nvim-autopairs",
				"windwp/nvim-autopairs",
				config = function()
					require("nvim-autopairs").setup()
				end,
			},
		},
	})

	-- Debugging / Runners
	use({
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
		requires = {
			"mfussenegger/nvim-dap",
		},
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("dapui").setup()
		end,
	})

	-- Distraction free editing
	use({
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opt = true,
		wants = "twilight.nvim",
		requires = { "folke/twilight.nvim" },
		config = function()
			require("zen-mode").setup({
				plugins = {
					gitsigns = true,
					kitty = {
						enabled = true,
						font = "+2",
					},
				},
			})
		end,
	})

	-- Git Gutter
	use({
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		wants = "plenary.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("jonnobrow.gitsigns")
		end,
	})
	use({
		"TimUntersberger/neogit",
		cmd = "Neogit",
		config = function()
			require("jonnobrow.neogit")
		end,
	})
end

return setup(plugins)
