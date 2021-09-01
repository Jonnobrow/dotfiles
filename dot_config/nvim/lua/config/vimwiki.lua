local g = vim.g

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


local wk = require('which-key')

-- Remap Global Mappings
wk.register({
    ['<leader>v'] = {
        name = "+vimwiki",
        w = {"<Plug>VimwikiIndex<cr>", "Vimwiki Index"},
        t = {"<Plug>VimwikiTabIndex<cr>", "Vimwiki Tab Index"},
        i = {"<Plug>VimwikiDiaryIndex<cr>", "Vimwiki Diary Index"},
        s = {"<Plug>VimwikiUISelect<cr>", "List Available Wikis"},
    },
    ['<leader>vv'] = {
        w = {"<Plug>VimwikiMakeDiaryNote<cr>", "Diary for today"},
        t = {"<Plug>VimwikiTabMakeDiaryNote<cr>", "Diary for today (new tab)"},
        y = {"<Plug>VimwikiMakeYesterdayDiaryNote<cr>", "Diary for yesterday"},
        m = {"<Plug>VimwikiMakeTomorrowDiaryNote<cr>", "Diary for tomorrow"},
    }
})
