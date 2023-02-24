-- Leader/local leader
vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- Load lazy.vim - cloned by Chezmoi Externals
vim.opt.runtimepath:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

-- Disable some unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Setup Lazy
require('lazy').setup('plugins', {
  defaults = { lazy = true },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
})

-- Improve Startup Time
require 'impatient'

-- Apply VIM Options
require 'config.options'
