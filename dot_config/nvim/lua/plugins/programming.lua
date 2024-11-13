return {
	-- Include some extra config from LazyVim

	-- -- Languages
	{ import = "lazyvim.plugins.extras.lang.typescript" },
	{ import = "lazyvim.plugins.extras.lang.json" },
	{ import = "lazyvim.plugins.extras.lang.terraform" },
	{ import = "lazyvim.plugins.extras.lang.tex" },
	{ import = "lazyvim.plugins.extras.lang.python" },
	{ import = "lazyvim.plugins.extras.lang.markdown" },
	{ import = "lazyvim.plugins.extras.lang.helm" },
	{ import = "lazyvim.plugins.extras.lang.go" },
	{ import = "lazyvim.plugins.extras.lang.git" },
	{ import = "lazyvim.plugins.extras.lang.ansible" },
	{ import = "lazyvim.plugins.extras.lang.yaml" },
	{ import = "lazyvim.plugins.extras.lang.ruby" },

	-- -- Testing and Debugging
	{ import = "lazyvim.plugins.extras.dap.core" },
	{ import = "lazyvim.plugins.extras.test.core" },
	{ "nvim-neotest/neotest-python" },
	{
		"nvim-neotest/neotest",
		opts = {
			adapters = { "neotest-python" },
		},
	},

	-- -- Chezmoi
	{ import = "lazyvim.plugins.extras.util.chezmoi" },

	-- Github Copilot
	{ import = "lazyvim.plugins.extras.coding.copilot" },
	{ import = "lazyvim.plugins.extras.coding.copilot-chat" },
}
