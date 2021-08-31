local map = require('utils').map
local silent = {silent = true}

map('n', '<leader>ff', '<cmd>FZF<cr>', silent)
map('n', '<leader>bb', '<cmd>Buffers<cr>', silent)
map('n', '<leader>ll', '<cmd>Line<cr>', silent)
map('n', '<leader>rg', '<cmd>Rg<cr>', silent)
map('n', '<leader>fh', '<cmd>FZF ~<cr>', silent)
map('n', '<leader>gs', '<cmd>GFiles?', silent)
