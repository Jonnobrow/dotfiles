local vim = vim
local function plug(path, config)
    vim.validate {
        path = {path, 's'};
        config = {config, vim.tbl_islist, 'an array of packages'};
    }
    vim.fn["plug#begin"](path)
    for _,v in ipairs(config) do
        if type(v) == 'string' then
            vim.fn["plug#"](v)
        elseif type(v) == 'table' then
            local p = v[1]
            assert(p, 'Must specify package at first index.')
            v[1] = nil
            vim.fn["plug#"](p,v)
            v[1] = p
        end
    end
    vim.fn['plug#end']()
end

plug(tostring(os.getenv("XDG_CONFIG_HOME")) .. '/nvim/plugged', {

        -- Treesitter
        'nvim-treesitter/nvim-treesitter';

        -- Telescope
        'nvim-telescope/telescope.nvim';
        'nvim-lua/plenary.nvim';
        'nvim-lua/popup.nvim';
        'nvim-telescope/telescope-fzy-native.nvim';
        'nvim-telescope/telescope-symbols.nvim';

        -- Git
        'APZelos/blamer.nvim';
        'rhysd/git-messenger.vim';
        'tpope/vim-fugitive';
        'gisphm/vim-gitignore';
        'airblade/vim-gitgutter';

        -- CoC
        {'neoclide/coc.nvim'; branch = 'release'};

        -- Snippets
        'mthnglac/vim-snippets';

        -- Filetree
        'preservim/nerdtree';
        'Xuyuanp/nerdtree-git-plugin';

        -- Language Support
        'sheerun/vim-polyglot';

        -- Icons
        'ryanoasis/vim-devicons';

        -- Prettier plugin
        {'prettier/vim-prettier'; run = 'yarn install'};

        -- Markdown Preview
        {'iamcco/markdown-preview.nvim';
            run = 'cd app && yarn install'};

        -- Themes
        'vim-airline/vim-airline';
        'vim-airline/vim-airline-themes';

        {'pineapplegiant/spaceduck'; branch = 'main'};
})
