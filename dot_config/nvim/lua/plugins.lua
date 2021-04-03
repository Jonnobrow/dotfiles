local packer = nil
local function init()
    if packer == nil then
        packer = require('packer')
        packer.init({disable_commands = true})
    end

    local use = packer.use
    packer.reset()

    -- Packer
    use {'wbthomason/packer.nvim', opt = true}

    -- Search
    use {
        'junegunn/fzf.vim'
        -- config = [[require('plugins.fzf')]]
    }
    use 'gfanto/fzf-lsp.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = [[require('config.telescope')]]
    }

    -- Completion and Linting
    use {
        {'kosayoda/nvim-lightbulb', config = [[require('config.lightbulb')]]},
        'onsails/lspkind-nvim', 'neovim/nvim-lspconfig',
        'nvim-lua/lsp-status.nvim', {
            'nvim-treesitter/nvim-treesitter',
            requires = {
                'nvim-treesitter/nvim-treesitter-refactor',
                'nvim-treesitter/nvim-treesitter-textobjects'
            },
            config = [[require('config.treesitter')]]
        }
    }
    use {
        'hrsh7th/nvim-compe',
        config = [[require('config.compe')]],
        event = 'InsertEnter *'
    }
    use {
        'hrsh7th/vim-vsnip',
        config = [[require('config.vsnip')]],
        event = 'InsertEnter *'
    }

    -- Project Management/Sessions
    use {
        'dhruvasagar/vim-prosession',
        after = 'vim-obsession',
        requires = {{'tpope/vim-obsession', cmd = 'Prosession'}},
        config = [[require('config.prosession')]]
    }

    -- Prettification
    use 'junegunn/vim-easy-align'
    use {'mhartington/formatter.nvim', config = [[require('config.format')]]}

    -- LaTeX
    use {
        'lervag/vimtex' -- config = [[require('config.vimtex')]]
    }

    -- Git
    use {
        'tpope/vim-fugitive', {
            'lewis6991/gitsigns.nvim',
            requires = {'nvim-lua/plenary.nvim'}
            -- config = [[require('config.gitsigns')]]
        }, {'TimUntersberger/neogit', opt = true}
    }

    -- Profiling
    use {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
        config = [[vim.g.startuptime_tries = 10]]
    }

    -- Highlight colors
    use {
        'norcalli/nvim-colorizer.lua',
        ft = {'css', 'javascript', 'vim', 'html'},
        config = [[require('colorizer').setup {'css', 'javascript', 'vim', 'html'}]]
    }

    -- Tree
    use {
        'preservim/nerdtree',
        requires = {
            {'kyazdani42/nvim-web-devicons', opt = true},
            {'ryanoasis/vim-devicons', opt = true}
        },
        config = [[require('config.nerdtree')]]
    }

    -- Colorscheme
    use {
        'hoob3rt/lualine.nvim',
        requires = {
            {'kyazdani42/nvim-web-devicons', opt = true},
            {'ryanoasis/vim-devicons', opt = true}
        },
        config = [[require('config.lualine')]]
    }

    use {'pineapplegiant/spaceduck', branch = 'main'}
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
    end
})

return plugins
