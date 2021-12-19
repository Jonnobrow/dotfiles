local wk = require("which-key")

local M = {}

function M.setup(client, bufnr)
	-- Mappings.
	local opts = { noremap = true, silent = true, buffer = bufnr }

	local keymap = {
		l = {
			name = "+lsp",
			r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
			c = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename (Change)" },
			a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
			d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },

			l = {
				name = "+lsp",
				i = { "<cmd>LspInfo<cr>", "Lsp Info" },
				a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder" },
				r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder" },
				l = {
					"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
					"List Folders",
				},
			},
		},
		x = {
			s = { "<cmd>Telescope document_diagnostics<cr>", "Search Document Diagnostics" },
			w = { "<cmd>Telescope workspace_diagnostics<cr>", "Workspace Diagnostics" },
		},
	}

	local keymap_visual = {
		l = {
			name = "+lsp",
			a = { ":<C-U>lua vim.lsp.buf.range_code_action()<CR>", "Code Action" },
		},
	}

	local keymap_goto = {
		name = "+goto",
		r = { "<cmd>Telescope lsp_references<cr>", "References" },
		R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
		d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
		dv = { "<Cmd>vsplit | lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
		ds = { "<Cmd>split | lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
		I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
		-- I = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
	}

	local keymap_debug = {
		name = "+debug",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
		u = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle DAP UI" },
		c = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
		l = { "<cmd>lua require'dap'.step_into()<CR>", "Step Into" },
		j = { "<cmd>lua require'dap'.step_over()<CR>", "Step Over" },
		t = {
			name = "+telescope",
			v = { "<cmd>Telescope dap variables<cr>", "Variables" },
			c = { "<cmd>Telescope dap commands<cr>", "Commands" },
			b = { "<cmd>Telescope dap list_breakpoints<cr>", "List Breakpoints" },
		},
	}

	--util.nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	--util.nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	--util.nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	--util.nnoremap("[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
	--util.nnoremap("]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
	-- Set some keybinds conditional on server capabilities

	if client.resolved_capabilities.document_formatting then
		keymap.l.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
	elseif client.resolved_capabilities.document_range_formatting then
		keymap_visual.l.f = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Format Range" }
	end

	wk.register(keymap, { buffer = bufnr, prefix = "<leader>" })
	wk.register(keymap_visual, { buffer = bufnr, prefix = "<leader>", mode = "v" })
	wk.register(keymap_goto, { buffer = bufnr, prefix = "g" })
	wk.register(keymap_debug, { buffer = bufnr, prefix = "D" })
end

return M
