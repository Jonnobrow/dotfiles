-- Globals
Option.g({
    syntax = "on",
    encoding = "UTF-8",
    compatible = false,

    -- Tabs
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    --[[
    ---------------------------------------------
    --                  Editor
    ---------------------------------------------
    --]]

    -- remove highlighting when search is done
    hlsearch = true,
    showmode = false,

    --[[
    ---------------------------------------------
    --                  Editing
    ---------------------------------------------
    --]]

    ignorecase = true,

    -- Window splits
    splitright = true,
    splitbelow = true,

    --
    hidden = true,

    -- [[
    -- UI
    -- ]]
    termguicolors = true,
    background = 'dark'

})

Option.w({
    number = true,
    relativenumber = true,

    signcolumn = 'yes',

    scrolloff = 8,
    wrap = false,
    colorcolumn = "100"

})
