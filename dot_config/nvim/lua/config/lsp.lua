-- Diagnostics symbols for display in the sign column.
vim.fn.sign_define("LspDiagnosticsSignError", { texthl = "LspDiagnosticsSignError", text = "✖", numhl = "LspDiagnosticsSignError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { texthl = "LspDiagnosticsSignWarning", text = "❢", numhl = "LspDiagnosticsSignWarning" })
vim.fn.sign_define("LspDiagnosticsSignHint", { texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { texthl = "LspDiagnosticsSignInformation", text = "𝓲", numhl = "LspDiagnosticsSignInformation" })

-- Common Configuration
local common_config = {}

local function key_maps(bufnr)
	--Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { buffer=bufnr, noremap=true, silent=true }

	local maps = {
		["<leader>l"] = {
			name = "Lsp",
			a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
			d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
			D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
			i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
			k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
			h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Help" },
			n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
			r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
            f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Formatting"}
		},
		["[d"] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Prev Diagnostics" },
		["]d"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostics" }
	}

	require("which-key").register(maps, opts);
end

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

-- Python :: npm i -g pyright
require("lspconfig").pyright.setup {
	cmd = { "/usr/local/bin/pyright-langserver", "--stdio" },
	on_attach = common_config.common_on_attach,
	capabilities = common_config.capabilities,
	filetypes = { "python" },
	rootPatterns = { ".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt" },
	settings = {
        python = {
            analysis = {
				typeCheckingMode = "basic",
				reportUnusedImport = true,
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
                autoImportCompletions = true
            }
        }
	}
}

-- Docker :: npm i -g dockerfile-language-server-nodejs
require'lspconfig'.dockerls.setup{
	on_attach = common_config.common_on_attach,
    capabilities = capabilities
}

-- Yaml :: yarn global add yaml-language-server
require'lspconfig'.yamlls.setup{
	on_attach = common_config.common_on_attach,
    capabilities = capabilities
}

-- JSON :: npm i -g vscode-langservers-extracted
require'lspconfig'.jsonls.setup {
  cmd = {"vscode-json-languageserver", "--stdio"},
  on_attach = common_config.common_on_attach,
  capabilities = capabilities,
  commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

-- Go :: GO111MODULE=on go get golang.org/x/tools/gopls@latest
require'lspconfig'.gopls.setup{
  on_attach = common_config.common_on_attach,
  capabilities = capabilities
}

require'lspconfig'.terraformls.setup{
  on_attach = common_config.common_on_attach,
  capabilities = capabilities
}

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
-- https://github.com/mattn/efm-langserver
require('lspconfig').efm.setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    root_dir = vim.loop.cwd,
    settings = {
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
        }
    }
}
