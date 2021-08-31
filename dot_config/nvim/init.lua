local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local api = vim.api
local map = require('utils').map

-- Packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec( [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- package manager
  use 'morhetz/gruvbox' -- theme
  
  -- lualine
  use {
    'hoob3rt/lualine.nvim',
    config = [[require('config.lualine')]],
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  
  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- fzf
  use {
    {'junegunn/fzf.vim', config = [[require('config.fzf')]]},
    'gfanto/fzf-lsp.nvim'
  }

  -- Git
  use {
    { 'tpope/vim-fugitive',
        cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' },
        disable = true },
    {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = [[require('config.gitsigns')]],
    },
    { 'TimUntersberger/neogit', 
        cmd = 'Neogit', 
        config = [[require('config.neogit')]] },
  }

  -- Notes
  use {
    {'vimwiki/vimwiki', config = [[require('config.vimwiki')]]},
    {'michal-h21/vim-zettel', config = [[require('config.vim-zettel')]]}
  }
end)

-- Leader and Local Leader
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- Speedy remote provider loading ~ wbthomason/dotfiles
g.loaded_python_provider = 0
g.python_host_prog = '/usr/bin/python2'
g.python3_host_prog = '/usr/bin/python3'
g.node_host_prog = '/usr/bin/neovim-node-host'

-- Disable built-ins
local disabled_built_ins = {
	'gzip', 'man', 'matchit', 'matchparen',
	'shada_plugin', 'tarPlugin', 'tar',
	'zipPlugin', 'zip', 'netrwPlugin'
}
for i = 1, 10 do
	g ['loaded_' .. disabled_built_ins[i]] = i
end

-- Default VIM Settings
o.textwidth = 72
bo.textwidth = 72
o.scroll = 7
o.wildignore = '*.o,*~,*.pyc'
o.wildmode = 'longest,full'
o.whichwrap = o.whichwrap .. '<,>,h,l'
o.lazyredraw = true
o.showmatch = true
o.ignorecase = true
o.smartcase = true
o.tabstop = 4
bo.tabstop = 4
o.softtabstop = 0
bo.softtabstop = 0
o.expandtab = true
bo.expandtab = true
o.shiftwidth = 4
bo.shiftwidth = 4
o.number = true
wo.number = true
o.relativenumber = true
wo.relativenumber = true
o.smartindent = true
bo.smartindent = true
o.laststatus = 2
o.showmode = false
o.shada = [['20,<50,s10,h,/100]]
o.hidden = true
o.shortmess = o.shortmess .. 'c'
o.completeopt = 'menuone,noselect'
o.joinspaces = false
o.updatetime = 150
o.conceallevel = 2
wo.conceallevel = 2
o.concealcursor = 'nc'
wo.concealcursor = 'nc'
o.previewheight = 5
o.undofile = true
bo.undofile = true
o.synmaxcol = 500
bo.synmaxcol = 500
o.display = 'msgsep'
o.cursorline = true
wo.cursorline = true
o.modeline = false
bo.modeline = false
o.mouse = 'nivh'
o.signcolumn = 'yes:1'
wo.signcolumn = 'yes:1'

-- Colourscheme
o.termguicolors = true
o.background = 'dark'
cmd [[colorscheme gruvbox]]

-- Keybindings

-- > [ space + w + h ] move cursor to left window
map('n', '<leader>wh', '<cmd>wincmd h<cr>', silent)
-- > [ space + w + l ] move cursor to bottom window
map('n', '<leader>wj', '<cmd>wincmd j<cr>', silent)
-- > [ space + w + j ] move cursor to top window
map('n', '<leader>wk', '<cmd>wincmd k<cr>', silent)
-- > [ space + w + k ] move cursor to right window
map('n', '<leader>wl', '<cmd>wincmd l<cr>', silent)
-- [ space + w + s ] current buffer, horizontal split
map('n', '<Leader>ws', '<Cmd>split<CR>', silent)
-- [ space + w + v ] current buffer, vertical split
map('n', '<Leader>wv', '<Cmd>vsplit<CR>', silent)
-- [ space + b + d] destroy buffer, fails if unsaved
map('n', '<Leader>bd', '<Cmd>bd<CR>', silent)
-- Yank to clipboad
map({'n', 'v'}, '<Leader>y', '"+y', silent)

-- Plugin Configuration
-- Most plugins have their own file under lua/config

-- > Bufferline : akinsho/bufferline
require('bufferline').setup{}
