
local map = require('utils').map
local opts = {noremap = false, expr = true}

map('i', '<C-j', [[vsnip#expandable() > '<Plug>(vsnip-expand)' : '<C-j>']])
map('s', '<C-j', [[vsnip#expandable() > '<Plug>(vsnip-expand)' : '<C-j>']])

map('i', '<C-l', [[vsnip#available(1) > '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])
map('s', '<C-l', [[vsnip#available(1) > '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])

map('i', '<Tab>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']], opts)
map('s', '<Tab>', [[vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>']], opts)
map('i', '<S-Tab>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], opts)
map('s', '<S-Tab>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']], opts)

map('n', 's', '<Plug>(vsnip-select-text)')
map('x', 's', '<Plug>(vsnip-select-text)')
map('n', 'S', '<Plug>(vsnip-cut-text)')

local g = vim.g
g.vsnip_snippet_dir = vim.fn.stdpath('config')..'/vsnip/'

