local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local api = vim.api

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
  augroup LengthHighlight 
    autocmd BufEnter *.{py,md,lua,go,yaml,yml} highlight OverLength ctermbg=darkgrey guibg=#592929
    autocmd BufEnter *.{py,md,lua,go,yaml,yml} match OverLength /\%82v.*/
  augroup END
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

  -- Completion and Snippets
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-nvim-lsp",
      "f3fora/cmp-spell",
      "rafamadriz/friendly-snippets"
    },
    config = [[require('config.nvim-cmp')]]
  }
  
  use 'folke/which-key.nvim' 

  -- LSP
	use {
		"neovim/nvim-lspconfig",
		config = [[require("config.lsp")]]
	}

  -- GPG
  use 'jamessan/vim-gnupg'
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
o.textwidth = 80
bo.textwidth = 80
vim.opt.formatoptions:remove('t')
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

-- Plugin Configuration
-- Most plugins have their own file under lua/config

-- > Bufferline : akinsho/bufferline
require('bufferline').setup{}

-- > Which Key : folke/which-key
require('which-key').setup{
    plugins = {
        marks = false,
        registers = false,
        spelling = {
            enabled = true,
            suggestions = 20,
        }
    }
}

-- Keybindings
require('which-key').register({
    ["<leader>p"] = {
        name = "+packer",
        s = {"<cmd>PackerSync<cr>", "Packer Sync"},
        i = {"<cmd>PackerInstall<cr>", "Packer Install"}
    },
    ["<leader>w"] = {
        name = "+window",
        h = {"<cmd>wincmd h<cr>", "Move Cursor to Left Window"},
        j = {"<cmd>wincmd j<cr>", "Move Cursor to Bottom Window"},
        k = {"<cmd>wincmd k<cr>", "Move Cursor to Top  Window"},
        l = {"<cmd>wincmd l<cr>", "Move Cursor to Right Window"},
        s = {"<cmd>split<cr>", "Horizontal Split"},
        v = {"<cmd>vsplit<cr>", "Vertical Split"},
        w = {"<cmd>w<cr>", "Write Changes"},
        q = {"<cmd>wq<cr>", "Write Changes and Quit"},
        Q = {"<cmd>q!<cr>", "Force Quit"},
        c = {"<cmd>close<cr>", "Close current window"}
    },
    ["<leader>b"] = {
        name = "+buffer",
        d = {"<cmd>bd<cr>", "Destroy Buffer"},
        s = {"<cmd>wa<cr>", "Write all Buffers"},
    },
    ["<leader>"] = {
        y = {'"+y', "Yank to clipboard"},
        q = {"<cmd>q<cr>", "Quit"}
    }
})
