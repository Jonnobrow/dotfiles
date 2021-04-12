local map = require('utils').map
vim.g.loaded_compe_treesitter = true
vim.g.loaded_compe_snippets_nvim = true
vim.g.loaded_compe_spell = true
vim.g.loaded_compe_tags = true
vim.g.loaded_compe_ultisnips = true
vim.g.loaded_compe_vim_lsc = true
vim.g.loaded_compe_vim_lsp = true

require('compe').setup {
    enabled = true,
    debug = false,
    min_length = 1,
    preselect = 'always',
    source = {
        path = true,
        buffer = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = true,
        spell = true
    }
}

local opts = {noremap = true, silent = true, expr = true}
map('i', '<c-c>', [[compe#complete()]], opts)
map('i', '<cr>', [[compe#confirm('<cr>')]], opts)
map('i', '<c-e>', [[compe#close('<c-e>')]], opts)
