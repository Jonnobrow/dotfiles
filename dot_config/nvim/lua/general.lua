local utils = require('utils')
local opt = utils.opt
local autocmd = utils.autocmd
local o, wo, bo = vim.o, vim.wo, vim.bo

local buffer = {o, bo}
local window = {o, wo}

opt('textwidth', 120, buffer)
opt('scrolloff', 8)

opt('tabstop', 4, buffer)
opt('softtabstop', 0, buffer)
opt('expandtab', true, buffer)
opt('shiftwidth', 4, buffer)

opt('completeopt', 'menuone,noselect')
opt('syntax', 'on')
opt('encoding', 'UTF-8')
opt('compatible', false)
opt('guifont', 'Hack 11')

opt('hlsearch', true)
opt('showmode', false)

opt('ignorecase', true)
opt('smartcase', true)

opt('splitright', true)
opt('splitbelow', true)

opt('hidden', true)

opt('number', true, window)
opt('relativenumber', true, window)
opt('signcolumn', 'yes:1', window)
opt('wrap', false, window)
opt('colorcolumn', '100', window)
opt('spelllang', 'en_gb')

autocmd('nvim_dotfiles',
        [[BufWritePost $HOME/.config/nvim/* !chezmoi add <afile>]], true)
autocmd('word_processing',
        [[FileType latex,tex,md,markdown setlocal spell showbreak=↳ wrap linebreak nolist]],
        true)

