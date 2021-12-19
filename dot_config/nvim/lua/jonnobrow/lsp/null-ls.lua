local M = {}

function M.setup(options)
	local nls = require("null-ls")
	nls.setup({
		debounce = 150,
		save_after_format = false,
		sources = {
			-- requires prettierd
			nls.builtins.formatting.prettierd,
			-- requires go
			nls.builtins.formatting.gofmt,
			-- requires stylua
			nls.builtins.formatting.stylua,
			-- requires shfmt
			nls.builtins.formatting.shfmt,
			-- requires fixjson
			nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
			-- requires terraform
			nls.builtins.formatting.terraform_fmt,
			-- requires awk
			nls.builtins.formatting.trim_newlines,
			nls.builtins.formatting.trim_whitespace,
			-- requires eslint_d
			nls.builtins.formatting.eslint_d,
			-- requires shellcheck
			nls.builtins.diagnostics.shellcheck,
			-- requires markdownlint
			nls.builtins.diagnostics.markdownlint,
			-- requires yamllint
			nls.builtins.diagnostics.yamllint,
			nls.builtins.code_actions.gitsigns,
		},
		on_attach = options.on_attach,
		root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".nvim.settings.json", ".git"),
	})
end

function M.has_formatter(ft)
	local sources = require("null-ls.sources")
	local available = sources.get_available(ft, "NULL_LS_FORMATTING")
	return #available > 0
end

return M
