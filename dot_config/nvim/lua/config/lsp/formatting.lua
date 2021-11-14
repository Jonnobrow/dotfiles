local M = {}

local format_disabled_var = function()
    return string.format("format_disabled_%s", vim.bo.filetype)
end
local format_options_var = function()
    return string.format("format_options_%s", vim.bo.filetype)
end

local format_options_prettier = {
    tabWidth = 4,
    singleQuote = true,
    trailingComma = "all",
    configPrecedence = "prefer-file",
}
vim.g.format_options_typescript = format_options_prettier
vim.g.format_options_javascript = format_options_prettier
vim.g.format_options_json = format_options_prettier
vim.g.format_options_css = format_options_prettier
vim.g.format_options_scss = format_options_prettier
vim.g.format_options_html = format_options_prettier
vim.g.format_options_yaml = format_options_prettier
vim.g.format_options_yaml = {
    tabWidth = 2,
    singleQuote = true,
    trailingComma = "all",
    configPrecedence = "prefer-file",
}
vim.g.format_options_markdown = format_options_prettier
vim.g.format_options_sh = {
    tabWidth = 4,
}

local function _if(bool,a,b)
   if bool then 
       return a
   else
       return b
   end
end

M.formatToggle = function(value)
    local var = format_disabled_var()
    vim.g[var] = _if(value ~= nil, value, not vim.g[var])
end
vim.cmd [[command! FormatDisable lua require'config.lsp.formatting'.formatToggle(true)]]
vim.cmd [[command! FormatEnable lua require'config.lsp.formatting'.formatToggle(false)]]

M.format = function()
    if not vim.b.saving_format and not vim.g[format_disabled_var()] then
        vim.b.init_changedtick = vim.b.changedtick
        vim.lsp.buf.formatting(vim.g[format_options_var()] or {})
    end
end

return M
