local cmd = vim.cmd

-- Leader and Local Leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Speedy remote provider loading ~ wbthomason/dotfiles
vim.g.loaded_python_provider = 0
vim.g.python_host_prog = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.node_host_prog = '/usr/bin/neovim-node-host'

vim.opt.expandtab = true
vim.opt.formatoptions = "crqnbj"
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.synmaxcol = 500
vim.opt.modeline = false
vim.opt.cursorline = true

vim.o.clipboard="unnamedplus,unnamed"
vim.o.completeopt = 'menuone,noselect,noinsert,noselect'
vim.o.diffopt = "internal,filler,closeoff,foldcolumn:0,hiddenoff"
vim.o.spelllang="en_gb"
vim.o.scroll = 7
vim.o.undodir = vim.fn.expand "~/.config/nvim/backups"
vim.o.wildignore = '*.o,*~,*.pyc'
vim.o.wildmode = 'longest,full'
vim.o.whichwrap = vim.o.whichwrap .. '<,>,h,l'
vim.o.lazyredraw = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.laststatus = 2
vim.o.showmode = false
vim.o.shada = [['20,<50,s10,h,/100]]
vim.o.hidden = true
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.joinspaces = false
vim.o.updatetime = 150
vim.o.conceallevel = 2
vim.o.concealcursor = 'nc'
vim.o.previewheight = 5
vim.o.display = 'msgsep'
vim.o.cursorline = true
vim.o.mouse = 'nivh'
vim.o.signcolumn = 'yes:1'

vim.wo.foldenable = false
vim.wo.foldlevel = 2
vim.wo.foldmethod = "indent"
vim.wo.colorcolumn = "+1"
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.concealcursor = 'nc'
vim.wo.conceallevel = 2
vim.wo.cursorline = true
vim.wo.signcolumn = 'yes:1'
vim.wo.cursorline = true
vim.wo.linebreak = true
vim.wo.breakindent = true

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
vim.o.termguicolors = true
vim.o.background = 'dark'

-- don't load the plugins below
vim.g.loaded_gzip = 1
vim.g.loaded_fzf = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
