local map = require('utils').map

require('compe').setup {
    source = {
        path = true,
        buffer = false,
        calc = true,
        emoji = {kind = " ﲃ "}, 
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = true,
        spell = true,
        tags = false
    }
}

local opts = {noremap = true, silent = true, expr = true}
map('i', '<C-Space>', [[compe#complete()]], opts)
map('i', '<CR>', [[compe#confirm('<cr>')]], opts)
map('i', '<C-e>', [[compe#close('<c-e>')]], opts)
