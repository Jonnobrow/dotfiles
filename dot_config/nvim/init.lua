local cmd = vim.cmd
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
  augroup Spell
    autocmd BufEnter *.md set spell
    autocmd VimEnter * highlight SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
    autocmd VimEnter * highlight SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
    autocmd VimEnter * highlight SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
    autocmd VimEnter * highlight SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f
  augroup END
]],
  false
)

require("settings")
require("plugins")

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
        q = {"<cmd>q<cr>", "Quit"},
        m = {"<cmd>call mkdir(expand(\"%:p:h\"), \"p\")<CR>", "Make current directory"}
    }
})
