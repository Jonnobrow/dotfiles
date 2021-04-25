local map = require('utils').map

require('compe').setup {
    enabled = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        path = true,
        buffer = false,
        calc = true,
        emoji = {kind = " ﲃ "},
        nvim_lsp = true,
        vsnip = true,
        spell = true,
        tags = false
    }
}

local opts = {noremap = true, silent = true, expr = true}
map('i', '<c-c>', [[compe#complete()]], opts)
map('i', '<cr>', [[compe#confirm('<cr>')]], opts)
map('i', '<c-e>', [[compe#close('<c-e>')]], opts)
