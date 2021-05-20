local utils = require('utils')
local map = utils.map
local silent = {silent = true}
-- [ space + w + h ] move cursor to left window
map('n', '<leader>wh', '<cmd>wincmd h<cr>', silent)
-- [ space + w + l ] move cursor to bottom window
map('n', '<leader>wj', '<cmd>wincmd j<cr>', silent)
-- [ space + w + j ] move cursor to top window
map('n', '<leader>wk', '<cmd>wincmd k<cr>', silent)
-- [ space + w + k ] move cursor to right window
map('n', '<leader>wl', '<cmd>wincmd l<cr>', silent)
-- [ space + w + n ] new buffer, horizontal split
map('n', '<Leader>wn', '<Cmd>new<CR>', silent)
-- [ space + w + s ] current buffer, horizontal split
map('n', '<Leader>ws', '<Cmd>split<CR>', silent)
-- [ space + w + v ] current buffer, vertical split
map('n', '<Leader>ws', '<Cmd>vsplit<CR>', silent)
-- [ space + w + v ] current buffer, vertical split
map('n', '<Leader>ws', '<Cmd>vsplit<CR>', silent)
-- [ space + w + d ] close current window
map('n', '<Leader>wd', '<cmd>close<CR>', silent)
-- [ space + q ] close all windows]
map('n', '<Leader>q', '<cmd>qa<CR>', silent)
-- [ space + b + d] destroy buffer, fails if unsaved
map('n', '<Leader>bd', '<Cmd>bd<CR>', silent)
-- Yank to clipboad
map({'n', 'v'}, '<Leader>y', '"+y', silent)
