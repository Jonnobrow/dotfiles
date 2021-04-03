local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local lspkind = require('lspkind')
local lsp = vim.lsp
local buf_keymap = vim.api.nvim_buf_set_keymap
local cmd = vim.cmd

local kind_symbols = {
    Text = '',
    Method = 'Ƒ',
    Function = 'ƒ',
    Constructor = '',
    Variable = '',
    Class = '',
    Interface = 'ﰮ',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '了',
    Keyword = '',
    Snippet = '﬌',
    Color = '',
    File = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = ''
}

local sign_define = vim.fn.sign_define
sign_define('LspDiagnosticsSignError', {text = '', numhl = 'RedSign'})
sign_define('LspDiagnosticsSignWarning', {text = '', numhl = 'YellowSign'})
sign_define('LspDiagnosticsSignInformation', {text = '', numhl = 'WhiteSign'})
sign_define('LspDiagnosticsSignHint', {text = '', numhl = 'BlueSign'})
lsp_status.config {
    kind_labels = kind_symbols,
    select_symbol = function(cursor_pos, symbol)
        if symbol.valueRange then
            local value_range = {
                ['start'] = {
                    character = 0,
                    line = vim.fn.byte2line(symbol.valueRange[1])
                },
                ['end'] = {
                    character = 0,
                    line = vim.fn.byte2line(symbol.valueRange[2])
                }
            }

            return require('lsp-status/util').in_range(cursor_pos, value_range)
        end
    end,
    current_function = false
}

lsp_status.register_progress()
lspkind.init {symbol_map = kind_symbols}
lsp.handlers['textDocument/publishDiagnostics'] =
    lsp.with(lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        underline = true
    })

local keymap_opts = {noremap = true, silent = true}
local function on_attach(client)
    lsp_status.on_attach(client)
    buf_keymap(0, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
    buf_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gTD', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', 'gA', '<cmd>lua vim.lsp.buf.code_action()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', '<leader>e',
               '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
               keymap_opts)
    buf_keymap(0, 'n', '<leader>E',
               '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', keymap_opts)
    buf_keymap(0, 'n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>',
               keymap_opts)
    buf_keymap(0, 'n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>',
               keymap_opts)

    if client.resolved_capabilities.document_formatting then
        buf_keymap(0, 'n', '<leader>lf',
                   '<cmd>lua vim.lsp.buf.formatting()<cr>', keymap_opts)
    end

    if client.resolved_capabilities.document_highlight == true then
        cmd('augroup lsp_aucmds')
        cmd('au CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
        cmd(
            'au CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()')
        cmd('au CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
        cmd('augroup END')
    end
end

local servers = {
    bashls = {},
    cssls = {
        filetypes = {"css", "scss", "less", "sass"},
        root_dir = lspconfig.util.root_pattern("package.json", ".git")
    },
    -- ghcide = {},
    html = {
    },
    jsonls = {
        commands = {
            Format = {
                function()
                    vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"), 0})
                end
            }
        }
    },
    pyright = {settings = {python = {formatting = {provider = 'yapf'}}}},
    -- rust_analyzer = {},
    -- sumneko_lua = {
    --  cmd = {'lua-language-server'},
    --  settings = {
    --    Lua = {
    --      diagnostics = {globals = {'vim'}},
    --      runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
    --      workspace = {
    --        library = {
    --          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
    --          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
    --        }
    --      }
    --    }
    --  }
    -- },
    texlab = {
        settings = {
            latex = {
                forwardSearch = {
                    executable = 'okular',
                    args = {'--unique', 'file:%p#src:%l%f'}
                }
            }
        },
        commands = {
            TexlabForwardSearch = {
                function()
                    local pos = vim.api.nvim_win_get_cursor(0)
                    local params = {
                        textDocument = {uri = vim.uri_from_bufnr(0)},
                        position = {line = pos[1] - 1, character = pos[2]}
                    }
                    lsp.buf_request(0, 'textDocument/forwardSearch', params,
                                    function(err, _, _, _)
                        if err then error(tostring(err)) end
                    end)
                end,
                description = 'Run synctex forward search'
            }
        }
    },
    tsserver = {},
    vimls = {},
    yamlls = {},
    terraformls = {settings = {trace = {server = "on"}}}
}

local snippet_capabilities = {
    textDocument = {completion = {completionItem = {snippetSupport = true}}}
}

for server, config in pairs(servers) do
    config.on_attach = on_attach
    config.capabilities = vim.tbl_deep_extend('keep', config.capabilities or {},
                                              lsp_status.capabilities,
                                              snippet_capabilities)
    lspconfig[server].setup(config)
end
