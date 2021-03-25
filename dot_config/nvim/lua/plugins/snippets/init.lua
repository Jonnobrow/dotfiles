Variables.g({
    UltiSnipsExpandTrigger = "<tab>",
    UltiSnipsJumpForwardTrigger = "<tab>",
    UltiSnipsJumpBackwardTrigger = "<s-tab>",
    completion_trigger_on_delete = 1,
    completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'},
    completion_enable_snippet = 'UltiSnips',
    completion_chain_complete_list = {{complete_items = {'lsp', 'snippet', 'buffers', 'path'}}},
    UltiSnipsEditSplit="vertical",
    UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit="$HOME/.config/nvim/snippets/"

})

local vim = vim
vim.api.nvim_exec([[ au BufEnter * lua require'completion'.on_attach() ]], false)
