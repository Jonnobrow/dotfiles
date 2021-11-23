local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.hcl.used_by = {"tf", "terraform", "packer", "nomad"}
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

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

