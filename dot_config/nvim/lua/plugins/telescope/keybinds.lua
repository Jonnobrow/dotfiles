-- Browsing
Keybind.g({
    -- search by filename in git files
	{ 'n', 'gf', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]],
    { noremap = true, silent = true } },
	-- buffer list window
	{ 'n', '<Leader>bb', [[<Cmd>lua require('telescope.builtin').buffers()<CR>]],
    { noremap = true, silent = true } },
	-- history
	{ 'n', '<Leader>fh', [[<Cmd>lua require('telescope.builtin').command_history()<CR>]],
		{ noremap = true, silent = true } },
	-- search by filename in all project files
	{ 'n', '<Leader>ff', [[<Cmd>lua require('telescope.builtin').find_files()<CR>]],
     { noremap = true, silent = true } },
})

-- Git
Keybind.g({
	-- git branches
	{ 'n', '<Leader>gc', [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]],
    { noremap = true, silent = true } },
})
