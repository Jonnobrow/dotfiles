local map = require('utils').map

require('compe').setup {
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
