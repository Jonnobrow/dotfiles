local utils = require('utils')
local map = utils.map

map('n', '<leader>tt', '<cmd>NERDTreeToggle<cr>', {noremap = true, silent = true})
map('n', '<leader>tf', '<cmd>NERDTreeFocus<cr>', {noremap = true, silent = true})

local g = vim.g
g.NERDTreeIgnore = {'\\.pyc$', '^__pycache__$', '.git$[[dir]]', '.swp', 'dist', 'tmp',
    'node_modules', 'bower_components', '.pnp'
}
g.NERDTreeAutoDeleteBuffer= 1
g.NERDTreeMinimalUI= 1
g.NERDTreeDirArrows= 1
g.NERDTreeWinSize= 45
