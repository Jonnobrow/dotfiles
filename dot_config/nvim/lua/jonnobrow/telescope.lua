local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

telescope.setup({
	extensions = {
		fzf = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
		project = {
			base_dirs = {
				"~/dirs/proj",
			},
		},
	},
	defaults = {
		mappings = { i = { ["<c-t>"] = trouble.open_with_trouble } },
		prompt_prefix = " ",
		selection_caret = " ",
		winblend = 10,
	},
})

telescope.load_extension("fzf")
telescope.load_extension("project")
telescope.load_extension("dap")

local M = {}

M.project_files = function(opts)
	opts = opts or {}

	local _git_pwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

	if vim.v.shell_error ~= 0 then
		local client = vim.lsp.get_active_clients()[1]
		if client then
			opts.cwd = client.config.root_dir
		end
		require("telescope.builtin").find_files(opts)
		return
	end

	require("telescope.builtin").git_files(opts)
end

return M
