local lsp_installer = require "nvim-lsp-installer"

local lsp_keymaps = require "config.lsp.keymaps"
local capabilities = require "config.lsp.capabilities"

require "config.lsp.handlers"

local M = {}


local function documentHighlight(client)
	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
		[[
			augroup lsp_document_highlight
			autocmd! * <buffer>
			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]],
		false
		)
	end
end

function common_config.common_on_attach(client, bufnr)
	key_maps(bufnr)
	documentHighlight(client)
end

-- cmp-lsp capabilities
common_config.capabilities = vim.lsp.protocol.make_client_capabilities()
common_config.capabilities = require('cmp_nvim_lsp').update_capabilities(common_config.capabilities)
--
-- General Language Server
local vint = {
    lintCommand = "vint -",
    lintStdin = true,
    lintFormats = {"%f:%l%c: %m"},
    lintSource = "vint"
}
local isort = {
    formatCommand = "isort --stdout -",
    formatStdin = true
}
local flake8 = {
    lintCommand = "flake8 --max-line-length 72 --format '%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s' --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = {"%f:%l:%c: %t%n%n%n %m"},
    lintSource = "flake8"
}
local prettier = {
    formatCommand = ([[
        $([ -n "$(command -v node_modules/.bin/prettier)" ] && echo "node_modules/.bin/prettier" || echo "prettier")
        ${--config-precedence:configPrecedence}
        ${--tab-width:tabWidth}
        ${--single-quote:singleQuote}
        ${--trailing-comma:trailingComma}
    ]]):gsub(
        "\n",
        ""
    )
}
local terraform = {
    formatCommand = "terraform fmt - ",
    formatStdin = true
}


local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)
    local opts = {}

    opts.on_attach = common_config.common_on_attach
    opts.capabilities = common_config.capabilities
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
    if server.name == "yamlls" then
        opts.settings.yaml.schemaStore.enabled = true
    end

    if server.name == "efm" then
        opts.init_options = { documentFormatting = true }
        opts.root_dir = vim.loop.cwd
        opts.settings = {
        rootMarkers = {".git/"},
        languages = {
            vim = {vint},
            python = {isort, flake8},
            yaml = {prettier},
            json = {prettier},
            html = {prettier},
            scss = {prettier},
            css = {prettier},
            markdown = {prettier},
            terraform = {terraform}
        }
    }
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)


