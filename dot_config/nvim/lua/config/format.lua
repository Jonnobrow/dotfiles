local map = require('utils').map

local function prettier()
    return {
        exe = 'prettier',
        args = {
            '--stdin-filepath', vim.api.nvim_buf_get_name(0), '--single-quote'
        },
        stdin = true
    }
end

local function rustfmt()
    return {exe = 'rustfmt', args = {'--emit=stdout'}, stdin = true}
end
local function lua_format() return {exe = 'lua-format', stdin = true} end
local function yapf() return {exe = 'yapf', stdin = true} end
local function isort()
    return {exe = 'isort', args = {'-', '--quiet'}, stdin = true}
end
local function latexindent()
    return {
        exe = 'latexindent',
        args = {'-sl', '-g /dev/stderr', '2>/dev/null'},
        stdin = true
    }
end
local function terraformfmt()
    return {exe = 'terraform', args = {'fmt', '-'}, stdin = true}
end

require('formatter').setup({
    logging = false,
    filetype = {
        javascript = {prettier},
        json = {prettier},
        html = {prettier},
        rust = {rustfmt},
        python = {isort, yapf},
        tex = {latexindent},
        lua = {lua_format},
        tf = {terraformfmt}
    }
})

-- Keymap
map('n', '<leader>f', '<cmd>Format<cr>', silent)
