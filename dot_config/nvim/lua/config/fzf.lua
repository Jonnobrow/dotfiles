local wk = require('which-key')

wk.register({
    ["<leader>f"] = {
        name = "+FZF",
        f = {"<cmd>FZF<cr>", "Search Files (Current Dir)"},
        b = {"<cmd>Buffers<cr>", "Search Buffers"},
        l = {"<cmd>Line<cr>", "Search Lines"},
        h = {"<cmd>FZF ~<cr>", "Search File (Home Dir)"},
        g = {"<cmd>GFiles?<cr>", "Search Git Files"},
        r = {"<cmd>Rg<cr>", "Search Body (Ripgrep)"},
        z = {"<cmd>FZF ~/dirs/doc/z<cr>", "Search Zettel Files"}
    }
})
