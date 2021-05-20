local g = vim.g
local cmd = vim.cmd
local utils = require('utils')
local opt = utils.opt

-- Leader / Local Leader
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- Skip some remote provider loading
g.loaded_python_provider = 0
g.python3_host_prog = '/usr/bin/python'

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
    'gzip', 'man', 'matchit', 'matchparen', 'shada_plugin', 'tarPlugin', 'tar',
    'zipPlugin', 'zip', 'netrwPlugin'
}
for i = 1, 10 do g['loaded_' .. disabled_built_ins[i]] = 1 end

-- General Settings
require('general')

-- Plugins
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

-- Keybindings
require('keybinds')

-- Colorscheme
opt('termguicolors', true)
opt('background', 'dark')
cmd [[ colorscheme spaceduck ]]
