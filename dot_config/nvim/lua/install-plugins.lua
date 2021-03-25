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
        {'nvim-treesitter/nvim-treesitter'; run = ":TsUpdate"};

        -- Lua
        'nvim-lua/plenary.nvim';
        'nvim-lua/popup.nvim';

        -- Completion
        'nvim-lua/completion-nvim';
        'steelsojka/completion-buffers';
        'SirVer/ultisnips';
        'honza/vim-snippets';

        -- Language Support
        'neovim/nvim-lspconfig';
        'RishabhRD/popfix';
        'RishabhRD/nvim-lsputils';
        'sheerun/vim-polyglot';

        -- Telescope
        'nvim-telescope/telescope.nvim';
        'nvim-telescope/telescope-fzy-native.nvim';
        'nvim-telescope/telescope-symbols.nvim';

        -- Git
        'tpope/vim-fugitive';

        -- Filetree
        'preservim/nerdtree';
        'tiagofumo/vim-nerdtree-syntax-highlight';
        'Xuyuanp/nerdtree-git-plugin';

        -- Prettier plugin
        {'prettier/vim-prettier'; run = 'yarn install'};

        -- Markdown Preview
        {'iamcco/markdown-preview.nvim';
            run = 'cd app && yarn install'};

        -- Themes
        'hoob3rt/lualine.nvim';

        {'pineapplegiant/spaceduck'; branch = 'main'};

        -- Icons
        'ryanoasis/vim-devicons';

})
