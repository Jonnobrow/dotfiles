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
    {'junegunn/fzf', run = function() vim.fn['fzf#install'](0) end},
    {'junegunn/fzf.vim', config = [[require('config.fzf')]]},
    'gfanto/fzf-lsp.nvim'
  }

  -- Git
  use {
      "tpope/vim-fugitive",
      requires = 'airblade/vim-gitgutter',
      config = [[require('config.fugitive')]]
  }

  use "tpope/vim-commentary" -- comments
  use "tpope/vim-eunuch" -- unix helpers

  -- Notes
  use {
    {'vimwiki/vimwiki', config = [[require('config.vimwiki')]]},
    {'michal-h21/vim-zettel', config = [[require('config.vim-zettel')]]}
  }

  -- Completion and Snippets
  use {
      "ms-jpq/coq_nvim",
      requires = {
          { "ms-jpq/coq.artifacts", branch = "artifacts" },
          { "ms-jpq/coq.thirdparty", branch = "3p" },
          {
              "onsails/lspkind-nvim",
              config = function()
                  require("lspkind").init()
              end,
          },
      },
      branch = "coq",
      setup = function()
          vim.g.coq_settings = {
              keymap = { recommended = false }, -- for autopairs
              auto_start = "shut-up",
              ["display.pum.fast_close"] = false,
          }
      end,
      config = function()
          require("config.coq_nvim").setup()
      end,
  }
  
  use 'folke/which-key.nvim' 

  -- LSP
  use {
    'williamboman/nvim-lsp-installer',
    requires = {
	    "neovim/nvim-lspconfig",
        "b0o/SchemaStore.nvim",
    },
	config = function()
        require("config.lsp").setup {}
    end
  }
  use "ray-x/lsp_signature.nvim"
  use {
    "rmagatti/goto-preview",
    config = function()
        require("goto-preview").setup {}
    end
  }

  -- Sessions
  use {
      'rmagatti/auto-session',
      config = function()
        require('auto-session').setup {
          log_level = 'info',
          auto_session_suppress_dirs = {'~/'}
        }
      end
    }

  -- GPG
  use 'jamessan/vim-gnupg'

  -- Jinja
  use "lepture/vim-jinja"

end)
