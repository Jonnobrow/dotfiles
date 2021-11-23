local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.hcl.used_by = {"tf", "terraform", "packer", "nomad"}

require('nvim-treesitter.configs').setup({
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
  },
})

