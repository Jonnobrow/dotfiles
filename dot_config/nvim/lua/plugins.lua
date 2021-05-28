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
        {'junegunn/fzf.vim', config = [[require('config.fzf')]]},
        'gfanto/fzf-lsp.nvim'
    }

    -- Notes
    use {
        {
            'vimwiki/vimwiki',
            requires = {{'junegunn/fzf'}},
            config = [[require('config.vimwiki')]]
        }, 'michal-h21/vim-zettel'
    }

    -- Completion and Linting
    use {
        'onsails/lspkind-nvim', 'neovim/nvim-lspconfig',
        'nvim-lua/lsp-status.nvim',
        {
            'nvim-treesitter/nvim-treesitter',
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
        event = 'InsertEnter *',
        requires = {{'hrsh7th/vim-vsnip-integ'}}
    }
    use {'rafamadriz/friendly-snippets'}

    -- Prettification
    use 'junegunn/vim-easy-align'
    use {'mhartington/formatter.nvim', config = [[require('config.format')]]}

    -- Markdown
    use {'dhruvasagar/vim-table-mode'}

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
