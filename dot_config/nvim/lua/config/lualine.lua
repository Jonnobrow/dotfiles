local lualine = require 'lualine'

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

local config = {
    options = {
        theme = 'gruvbox' 
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {}
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_v = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {}
    }    
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- Left: Filename | Location | Progress | Diagnostics
ins_left {
    'filename',
    condition = conditions.buffer_not_empty
}
ins_left {'location'}
ins_left {'progress'}
ins_left {'diagnostics',
            sources = {'nvim_lsp'},
            symbols = {error = ' ', warn = ' ', info = ' '}}

-- Right: Encoding | Format | Git Branch | Git Diff
ins_right {'o:encoding', upper = true, condition = conditions.hide_in_width}
ins_right {'fileformat', upper = true, icons_enabled = true}
ins_right {'filetype', upper = true, icons_enabled = true}
ins_right {'branch', icon = '', condition = conditions.check_git_workspace}
ins_right {'diff', 
            symbols = {added = ' ', modified = '柳 ', removed = ' '},
            condition = conditions.hide_in_width}

-- Initialize Lualine
lualine.setup(config)

