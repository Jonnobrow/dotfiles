return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end
  }
  use 'nathom/filetype.nvim'
  use 'nvim-lua/plenary.nvim'

  use {
    'ellisonleao/gruvbox.nvim',
    requires = {'rktjmp/lush.nvim'},
    config = function()
      vim.cmd('colorscheme gruvbox')
    end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
    config = function()
      require('lualine').setup{
        options = {
          theme = 'gruvbox'
        }
      }
    end,
    after = 'gruvbox.nvim'
  }

  use {
    'akinsho/bufferline.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt=true},
    config = function()
        require('bufferline').setup{}
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup()
    end,
    opt = true,
    event = 'BufRead'
  }

  use {
    'michal-h21/vim-zettel',
    cmd = {'ZettelNew', 'ZettelOpen'},
    config = function ()
        require("jonnobrow.wiki").setup_zettel()
    end,
    requires = {
        "junegunn/fzf",
        "junegunn/fzf.vim",
        {
            "vimwiki/vimwiki",
            cmd = { 'VimwikiIndex' },
            config = function ()
                require('jonnobrow.wiki').setup_vimwiki()
            end
        }
    }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-refactor',
    },
    run = ':TSUpdate',
    config = function()
      require('jonnobrow.treesitter')
    end
  }

  use {
    'b3nj5m1n/kommentary',
    event = 'BufWinEnter'
  }

  use {
    'tpope/vim-fugitive',
    opt = true,
    cmd = 'G'
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    },
    config = function()
      require('telescope').load_extension('fzf')
    end,
    event = 'BufWinEnter'
  }

  use {
    'rmagatti/auto-session',
    event = 'VimEnter',
    config = function()
      require('auto-session').setup {
        auto_session_suppress_dirs = {'~/'}
      }
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    opt = true,
    cmd = { 'ColorizerToggle' },
    config = function()
      require('colorizer').setup()
    end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require("nvim-lsp-installer").on_server_ready(function(server)
          local get_opts = require("jonnobrow.lsp").get_opts
	      server:setup(get_opts(server.name))
      end)
    end,
    requires = {
      {
        'ray-x/lsp_signature.nvim',
        config = function()
          require('lsp_signature').setup({
            bind = true,
            handler_opts = {
              border = 'rounded',
            },
          })
        end,
        after = 'nvim-lspconfig',
      },
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      {
      	'williamboman/nvim-lsp-installer',
	    requires = {
            "b0o/SchemaStore.nvim",
            "folke/lua-dev.nvim"
    	},
      }
    },
  }

  use {
    'onsails/lspkind-nvim',
    event = 'InsertEnter',
  }

  -- Completion and Snippets
  --use {
  --    "ms-jpq/coq_nvim",
  --    requires = {
  --        { "ms-jpq/coq.artifacts", branch = "artifacts" },
  --        { "ms-jpq/coq.thirdparty", branch = "3p" },
  --    },
  --    branch = "coq",
  --    setup = function()
  --        vim.g.coq_settings = {
  --            keymap = { recommended = false }, -- for autopairs
  --            auto_start = "shut-up",
  --            ["display.pum.fast_close"] = false,
  --        }
  --    end,
  --    config = function()
  --        require "coq_3p"
  --    end,
  --}


  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('jonnobrow.lsp').init()
    end,
    requires = {
      {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'},
      {'saadparwaiz1/cmp_luasnip', after = 'cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer', after = 'cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lua', after = 'cmp-buffer'},
      {'hrsh7th/cmp-path', after = 'cmp-nvim-lua'},
      {'tamago324/cmp-zsh', after = 'cmp-path'},
      {
        'windwp/nvim-autopairs',
        config = function()
          require('jonnobrow.lsp').autopairs()
        end,
        after = 'cmp-path',
      },
    },
    after = 'lspkind-nvim',
  }

  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require('jonnobrow.snippets')
    end,
    requires = {
      'rafamadriz/friendly-snippets',
    }
  }

  use 'folke/which-key.nvim'
  use { "tweekmonster/startuptime.vim", cmd = { "StartupTime" } }

  use {'nvim-orgmode/orgmode',
    ft = {'org'},
    config = function()
            require('jonnobrow.org')
    end
    }
end)
