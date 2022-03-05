local neorg = require("neorg")

neorg.setup({
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.norg.concealer"] = {}, -- Allows for use of icons
		["core.norg.dirman"] = { -- Manage your directories with Neorg
			config = {
				workspaces = {
					notes = "~/dirs/neorg/notes",
				},
				autodetect = true,
				autochdir = true,
			},
		},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.keybinds"] = {
			config = {
				default_keybinds = true,
				neorg_leader = "<Leader>n",
			},
		},
		["core.integrations.telescope"] = {},
		["core.norg.esupports"] = {},
		["core.highlights"] = {},
	},
})

local neorg_callbacks = require("neorg.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
	keybinds.map_event_to_mode("norg", {
		n = {
			-- TODOs
			{ "gtd", "core.norg.qol.todo_items.todo.task_done" },
			{ "gtu", "core.norg.qol.todo_items.todo.task_undone" },
			{ "gtp", "core.norg.qol.todo_items.todo.task_pending" },
			{ "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" },

			-- Links
			{ "ZZ", "core.norg.dirman.new.note" },
			{ "<CR><CR>", "core.norg.esupports.goto_link" },
			{ "<C-s>", "core.integrations.telescope.find_linkable" },
		},
		i = {

			-- Telescope integration
			{ "<C-l>", "core.integrations.telescope.insert_link" },
		},
	}, { silent = true, noremap = true })
end)
