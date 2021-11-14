local lsp_installer = require "nvim-lsp-installer"

local lsp_keymaps = require "config.lsp.keymaps"
local capabilities = require "config.lsp.capabilities"

local isort = require"config.efm/isort"
local flake8 = require"config.efm/flake8"
local prettier = require"config.efm/prettier"
local terraform = require"config.efm/terraform"
local mypy = require"config.efm/mypy"
local shellcheck = require"config.efm/shellcheck"
local shfmt = require"config.efm/shfmt"

require "config.lsp.handlers"
require "config.lsp.formatting"

local M = {}

local function setup_handlers()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            spacing = 5,
            prefix = "",
        },
        signs = false, -- rely on highlight styles instead, don't want to clobber signcolumn
    })
end

local function common_on_attach(client, bufnr)


    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    lsp_keymaps.buf_set_keymaps(bufnr)

    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end

    if client.resolved_capabilities.document_highlight then
        lsp_keymaps.buf_autocmd_document_highlight()
    end

    if client.resolved_capabilities.document_formatting then
        vim.cmd [[augroup Format]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd BufWritePost <buffer> lua require'config.lsp.formatting'.format()]]
        vim.cmd [[augroup END]]
    end

    require("lsp_signature").on_attach {
        hint_enable = false,
        hi_parameter = "QuickFixLine",
        handler_opts = {
            border = vim.g.floating_window_border,
        },
    }
end

function M.setup()
    setup_handlers()

    lsp_installer.settings {
        ui = {
            icons = {
                server_installed = "",
                server_pending = "",
                server_uninstalled = "",
            },
        },
    }

    lsp_installer.on_server_ready(function(server)

        local coq = require "coq"
        local default_opts = {
            on_attach = common_on_attach,
            capabilities = capabilities.create {
                with_snippet_support = true
            },
        }

        local server_opts = {
            ["yamlls"] = function()
                return vim.tbl_deep_extend("force", default_opts, {
                    settings = {
                        yaml = {
                            hover = true,
                            completion = true,
                            validate = true,
                            schemas = require("schemastore").json.schemas()
                        }
                    }
                })
            end,
            ["jsonls"] = function()
                return vim.tbl_deep_extend("force", default_opts, {
                    settings = {
                        json = {
                            schemas = require("schemastore").json.schemas(),
                        },
                    },
                })
            end,
            ["terraformls"] = function()
                return vim.tbl_deep_extend("force", default_opts, {
                    filetypes = { "terraform", "tf", "tfvars" }
                })
            end,
            ["efm"] = function()
                return vim.tbl_deep_extend("force", default_opts, {
                    init_options = {documentFormatting = true},
                    root_dir = vim.loop.cwd,
                    settings = {
                        rootMarkers = {".git/"},
                        lintDebounce = 100,
                        languages = {
                            python = {isort, flake8, mypy},
                            yaml = {prettier},
                            json = {prettier},
                            markdown = {prettier},
                            terraform = {terraform},
                            html = {prettier},
                            css = {prettier},
                            scss = {prettier},
                            javascript = {prettier},
                            sh = {shellcheck, shfmt}
                        }
                    }
                })
            end,
        }

        server:setup(
            coq.lsp_ensure_capabilities(server_opts[server.name] and server_opts[server.name]() or default_opts))
        vim.cmd [[ do User LspAttachBuffers ]]
    end)
end


return M
