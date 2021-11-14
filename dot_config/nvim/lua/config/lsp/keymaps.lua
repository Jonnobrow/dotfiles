local M = {}

function M.buf_autocmd_document_highlight()
    vim.api.nvim_exec(
        [[
    augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold,CursorHoldI <buffer> call v:lua.my_document_highlight()
        autocmd CursorMoved,CursorMovedI <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]],
        false
    )
end

function _G.my_document_highlight()
    vim.lsp.buf.document_highlight()
end

_G.lsp_popup_opts = {
    show_header = false,
}

-- @param bufnr (number)
function M.buf_set_keymaps(bufnr)
	-- Mappings.
	local opts = { buffer=bufnr, noremap=true, silent=true }

	local maps = {
		["<leader>l"] = {
			name = "LSP",
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

return M
