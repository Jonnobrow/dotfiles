local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local api = vim.api

local opt = setmetatable({}, {
    __newindex = function(_, key, value)
        vim.o[key] = value
        vim.bo[key] = value
    end,
})

-- Leader and Local Leader
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- Speedy remote provider loading ~ wbthomason/dotfiles
g.loaded_python_provider = 0
g.python_host_prog = '/usr/bin/python2'
g.python3_host_prog = '/usr/bin/python3'
g.node_host_prog = '/usr/bin/neovim-node-host'

opt.textwidth = 80
opt.expandtab = true
opt.formatoptions = "crqnbj"
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.smartindent = true
opt.undofile = true
opt.undolevels = 10000
opt.synmaxcol = 500
opt.modeline = false

o.clipboard="unnamedplus,unnamed"
o.completeopt = 'menuone,noselect,noinsert,noselect'
o.diffopt = "internal,filler,closeoff,foldcolumn:0,hiddenoff"
o.spelllang="en_gb"
o.scroll = 7
o.undodir = vim.fn.expand "~/.config/nvim/backups"
o.wildignore = '*.o,*~,*.pyc'
o.wildmode = 'longest,full'
o.whichwrap = o.whichwrap .. '<,>,h,l'
o.lazyredraw = true
o.showmatch = true
o.ignorecase = true
o.smartcase = true
o.number = true
o.relativenumber = true
o.laststatus = 2
o.showmode = false
o.shada = [['20,<50,s10,h,/100]]
o.hidden = true
o.shortmess = o.shortmess .. 'c'
o.joinspaces = false
o.updatetime = 150
o.conceallevel = 2
o.concealcursor = 'nc'
o.previewheight = 5
o.display = 'msgsep'
o.cursorline = true
o.mouse = 'nivh'
o.signcolumn = 'yes:1'

wo.foldenable = false
wo.foldlevel = 2
wo.foldmethod = "indent"
wo.colorcolumn = "+1"
wo.number = true
wo.relativenumber = true
wo.concealcursor = 'nc'
wo.conceallevel = 2
wo.cursorline = true
wo.signcolumn = 'yes:1'
wo.cursorline = true
wo.linebreak = true
wo.breakindent = true

vim.opt.list = true
vim.opt.listchars = {
    space = "⋅",
    eol = "↴",
    tab = "__",
    trail = "•",
    extends = "❯",
    precedes = "❮",
    nbsp = "_",
}
vim.opt.fillchars = {
    fold = " ",
    diff = "╱",
}

-- Colourscheme
o.termguicolors = true
o.background = 'dark'
