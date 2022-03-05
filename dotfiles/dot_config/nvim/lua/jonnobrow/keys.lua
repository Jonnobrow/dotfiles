local wk = require("which-key")

vim.o.timeoutlen = 300

local presets = require("which-key.plugins.presets")
presets.objects["a("] = nil
wk.setup({
	show_help = false,
	triggers = "auto",
	plugins = { spelling = true },
	key_labels = { ["<leader>"] = "SPC" },
})

---- Move to window using the <ctrl> movement keys
--util.nmap("<left>", "<C-w>h")
--util.nmap("<down>", "<C-w>j")
--util.nmap("<up>", "<C-w>k")
--util.nmap("<right>", "<C-w>l")
--
---- Resize window using <ctrl> arrow keys
--util.nnoremap("<S-Up>", ":resize +2<CR>")
--util.nnoremap("<S-Down>", ":resize -2<CR>")
--util.nnoremap("<S-Left>", ":vertical resize -2<CR>")
--util.nnoremap("<S-Right>", ":vertical resize +2<CR>")
--
---- Move Lines
--util.nnoremap("<A-j>", ":m .+1<CR>==")
--util.vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
--util.inoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
--util.nnoremap("<A-k>", ":m .-2<CR>==")
--util.vnoremap("<A-k>", ":m '<-2<CR>gv=gv")
--util.inoremap("<A-k>", "<Esc>:m .-2<CR>==gi")
--
---- Switch buffers with tab
--util.nnoremap("<C-Left>", ":bprevious<cr>")
--util.nnoremap("<C-Right>", ":bnext<cr>")
--
---- Easier pasting
--util.nnoremap("[p", ":pu!<cr>")
--util.nnoremap("]p", ":pu<cr>")
--
---- Clear search with <esc>
--util.map("", "<esc>", ":noh<cr>")
--util.nnoremap("gw", "*N")
--util.xnoremap("gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
--util.nnoremap("n", "'Nn'[v:searchforward]", { expr = true })
--util.xnoremap("n", "'Nn'[v:searchforward]", { expr = true })
--util.onoremap("n", "'Nn'[v:searchforward]", { expr = true })
--util.nnoremap("N", "'nN'[v:searchforward]", { expr = true })
--util.xnoremap("N", "'nN'[v:searchforward]", { expr = true })
--util.onoremap("N", "'nN'[v:searchforward]", { expr = true })

local vnoremap = {
	-- better indenting
	["<"] = { "<gv", "Unindent" },
	[">"] = { ">gv", "Indent" },
}
wk.register(vnoremap, { noremap = true, mode = "v" })

local leader = {
	["w"] = {
		name = "+windows",
		["w"] = { "<C-W>p", "other-window" },
		["d"] = { "<C-W>c", "delete-window" },
		["-"] = { "<C-W>s", "split-window-below" },
		["|"] = { "<C-W>v", "split-window-right" },
		["2"] = { "<C-W>v", "layout-double-columns" },
		["h"] = { "<C-W>h", "window-left" },
		["j"] = { "<C-W>j", "window-below" },
		["l"] = { "<C-W>l", "window-right" },
		["k"] = { "<C-W>k", "window-up" },
		["H"] = { "<C-W>5<", "expand-window-left" },
		["J"] = { ":resize +5", "expand-window-below" },
		["L"] = { "<C-W>5>", "expand-window-right" },
		["K"] = { ":resize -5", "expand-window-up" },
		["="] = { "<C-W>=", "balance-window" },
		["s"] = { "<C-W>s", "split-window-below" },
		["v"] = { "<C-W>v", "split-window-right" },
	},
	b = {
		name = "+buffer",
		["b"] = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
		["p"] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
		["["] = { "<cmd>:BufferLineCyclePrev<CR>", "Previous Buffer" },
		["n"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
		["]"] = { "<cmd>:BufferLineCycleNext<CR>", "Next Buffer" },
		["d"] = { "<cmd>:BDelete this<CR>", "Delete Buffer" },
		["g"] = { "<cmd>:BufferLinePick<CR>", "Goto Buffer" },
	},
	g = {
		name = "+git",
		g = { "<cmd>Neogit kind=split<CR>", "NeoGit" },
		c = { "<Cmd>Telescope git_commits<CR>", "commits" },
		b = { "<Cmd>Telescope git_branches<CR>", "branches" },
		s = { "<Cmd>Telescope git_status<CR>", "status" },
		h = { name = "+hunk" },
	},
	h = {
		name = "+help",
		t = { "<cmd>:Telescope builtin<cr>", "Telescope" },
		c = { "<cmd>:Telescope commands<cr>", "Commands" },
		h = { "<cmd>:Telescope help_tags<cr>", "Help Pages" },
		m = { "<cmd>:Telescope man_pages<cr>", "Man Pages" },
		k = { "<cmd>:Telescope keymaps<cr>", "Key Maps" },
		s = { "<cmd>:Telescope highlights<cr>", "Search Highlight Groups" },
		l = { [[<cmd>TSHighlightCapturesUnderCursor<cr>]], "Highlight Groups at cursor" },
		f = { "<cmd>:Telescope filetypes<cr>", "File Types" },
		o = { "<cmd>:Telescope vim_options<cr>", "Options" },
		a = { "<cmd>:Telescope autocommands<cr>", "Auto Commands" },
		p = {
			name = "+packer",
			p = { "<cmd>PackerSync<cr>", "Sync" },
			s = { "<cmd>PackerStatus<cr>", "Status" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			c = { "<cmd>PackerCompile<cr>", "Compile" },
		},
	},
	f = {
		name = "+search",
		g = { "<cmd>Telescope live_grep<cr>", "Grep" },
		b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
		s = {
			function()
				require("telescope.builtin").lsp_document_symbols({
					symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module" },
				})
			end,
			"Goto Symbol",
		},
		h = { "<cmd>Telescope command_history<cr>", "Command History" },
		m = { "<cmd>Telescope marks<cr>", "Jump to Mark" },
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		n = { "<cmd>enew<cr>", "New File" },
	},
	o = {
		name = "+open",
		g = { "<cmd>Glow<cr>", "Markdown Glow" },
		n = { "<cmd>lua require('github-notifications.menu').notifications()<cr>", "GitHub Notifications" },
	},
	p = {
		name = "+project",
		p = { ":Telescope project<CR>", "Browse Projects" },
	},
	["<tab>"] = {
		name = "workspace",
		["<tab>"] = { "<cmd>tabnew<CR>", "New Tab" },
		n = { "<cmd>tabnext<CR>", "Next" },
		d = { "<cmd>tabclose<CR>", "Close" },
		p = { "<cmd>tabprevious<CR>", "Previous" },
		["]"] = { "<cmd>tabnext<CR>", "Next" },
		["["] = { "<cmd>tabprevious<CR>", "Previous" },
		f = { "<cmd>tabfirst<CR>", "First" },
		l = { "<cmd>tablast<CR>", "Last" },
	},
	["`"] = { "<cmd>:e #<cr>", "Switch to Other Buffer" },
	[" "] = "Find File",
	["."] = { ":Telescope file_browser<CR>", "Browse Files" },
	[","] = { "<cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
	["/"] = { "<cmd>Telescope live_grep<cr>", "Search" },
	[":"] = { "<cmd>Telescope command_history<cr>", "Command History" },
	q = {
		name = "+quit/session",
		q = { "<cmd>:qa<cr>", "Quit" },
		["!"] = { "<cmd>:qa!<cr>", "Quit without saving" },
		s = { [[<cmd>lua require("persistence").load()<cr>]], "Restore Session" },
		l = { [[<cmd>lua require("persistence").load({last=true})<cr>]], "Restore Last Session" },
		d = { [[<cmd>lua require("persistence").stop()<cr>]], "Stop Current Session" },
	},
	x = {
		name = "+errors",
		x = { "<cmd>TroubleToggle<cr>", "Trouble" },
		w = { "<cmd>TroubleWorkspaceToggle<cr>", "Workspace Trouble" },
		d = { "<cmd>TroubleDocumentToggle<cr>", "Document Trouble" },
		t = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
		T = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
		l = { "<cmd>lopen<cr>", "Open Location List" },
		q = { "<cmd>copen<cr>", "Open Quickfix List" },
	},
}

for i = 0, 10 do
	leader[tostring(i)] = "which_key_ignore"
end

wk.register(leader, { prefix = "<leader>" })
