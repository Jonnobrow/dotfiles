require("jonnobrow.lsp.saga")
require("jonnobrow.lsp.diagnostics").setup()
require("jonnobrow.lsp.kind").setup()

local function on_attach(client, bufnr)
	require("jonnobrow.lsp.formatting").setup(client, bufnr)
	require("jonnobrow.lsp.keys").setup(client, bufnr)
	-- require("jonnobrow.lsp.completion").setup(client, bufnr)
	-- require("jonnobrow.lsp.highlighting").setup(client)
end

local servers = {
	ansiblels = {},
	bashls = {},
	clangd = {},
	cssls = {},
	dockerls = {},
	eslint = {},
	gopls = {},
	html = {},
	jsonls = {},
	pyright = {},
	sumneko_lua = {},
	tsserver = {},
	vimls = {},
	tailwindcss = {},
	terraformls = {},
	tflint = {},
	yamlls = {},
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

--require("lua-dev").setup()

local options = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
}
require("jonnobrow.lsp.null-ls").setup(options)
require("jonnobrow.lsp.install").setup(servers, options)
