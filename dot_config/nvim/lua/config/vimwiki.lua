local g = vim.g

g.vimwiki_list = {
    {
        path = '~/dirs/doc/wiki/docs',
        syntax = 'markdown',
        ext = '.md',
    }
}

g.zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always"
