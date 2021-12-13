local g = vim.g

local M = {}

M.setup_zettel = function ()
    g.zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always"
    g.zettel_fzf_options = {"--exact", "--tiebreak=end", "--preview-window=right,70%"}
    g.zettel_options = {{
        front_matter = {{"tags", ""}, {"type","note"}},
        template = "~/dirs/doc/z/templates/note.tpl"
    }}
    g.zettel_format = "%y%m%d-%H%M-%title"
    g.zettel_date_format = "%y-%m-%d"
    g.zettel_default_title = "Note"
end

M.setup_vimwiki = function ()
    g.vimwiki_key_mappings = {
        global = 0,
        html = 0,
        mouse = 0
    }
    g.vimwiki_list = {
        {
            path = '~/dirs/doc/z/',
            syntax = 'markdown',
            ext = '.md',
            auto_toc = 1,
            auto_tags = 1,
            links_space_char = "_"
        }
    }
    g.markdown_folding = 1
    -- https://vimwiki.github.io/vimwikiwiki/Tips%20and%20Snips.html
    g.vimwiki_global_ext = 0
end

return M
