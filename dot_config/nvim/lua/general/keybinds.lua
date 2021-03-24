Keybind.g({
    --[[
	  ------------------------------------
	  -       CURSOR MOVE     
	  ------------------------------------
	  --]]
    -- [ space + w + h ] move cursor to left window
    { 'n', '<Leader>wh', '<Cmd>wincmd h<CR>', { noremap = true } },

    -- [ space + w + l ] move cursor to bottom window
    { 'n', '<Leader>wj', '<Cmd>wincmd j<CR>', { noremap = true } },

    -- [ space + w + j ] move cursor to top window
    { 'n', '<Leader>wk', '<Cmd>wincmd k<CR>', { noremap = true } },

    -- [ space + w + k ] move cursor to right window
    { 'n', '<Leader>wl', '<Cmd>wincmd l<CR>', { noremap = true } },

    --[[
    ------------------------------------
    --       WINDOW Controls
    -------------------------------------
    --]]
    -- [ space + w + n ] new buffer, horizontal split
    { 'n', '<Leader>wn', '<Cmd>new<CR>', {noremap = true} },

    -- [ space + w + s ] current buffer, horizontal split
    { 'n', '<Leader>ws', '<Cmd>split<CR>', {noremap = true} },

    -- [ space + w + v ] current buffer, vertical split
    { 'n', '<Leader>ws', '<Cmd>vsplit<CR>', {noremap = true} },

    -- [ space + w + v ] current buffer, vertical split
    { 'n', '<Leader>ws', '<Cmd>vsplit<CR>', {noremap = true} },

    -- [ space + w + d ] close current window
    { 'n', '<Leader>wd', '<Cmd>close<CR>', {noremap = true} },

    --[[
    -----------------------------------
    --        BUFFER CONTROLS
    -----------------------------------
    --]]
    -- [ space + b + d] destroy buffer, fails if unsaved
    { 'n', '<Leader>bd', '<Cmd>bd<CR>', {noremap = true} },
})
