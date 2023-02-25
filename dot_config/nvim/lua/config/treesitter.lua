require('nvim-treesitter.configs').setup {
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = false },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<cr>',
      node_incremental = '<tab>',
      scope_incremental = '<cr>',
      scope_decremental = '<s-cr>',
      node_decremental = '<s-tab>',
    },
  },  
  refactor = {
    smart_rename = { enable = true, keymaps = { smart_rename = 'grr' } },
    highlight_definitions = { enable = true },
  },
}
