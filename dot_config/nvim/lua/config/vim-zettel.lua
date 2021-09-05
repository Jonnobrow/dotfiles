local g = vim.g

g.zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always"
g.zettel_fzf_options = {"--exact", "--tiebreak=end", "--preview-window=right,70%"}
g.zettel_options = {{
    front_matter = {{"tags", ""}, {"type","note"}},
    template = "~/dirs/doc/z/templates/note.tpl"
}}
g.zettel_format = "%y%m%d-%H%M-%title"
g.zettel_date_format = "%y-%m-%d"
g.zettel_default_title = "Note"

local wk = require('which-key')
wk.register({
    ["<leader>z"] = {
        name = "+zettel",
        o = { "<cmd>ZettelOpen<cr>", "Open Zettel File" },
        n = { ":ZettelNew<space>", "New Note" },
        i = { "<cmd>ZettelInbox<cr>", "Insert Inbox"},
    }
})
