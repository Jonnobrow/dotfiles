local M = {}

M.init = function()
    local wk = require ("which-key")

    wk.setup {
        plugins = {
            marks = false,
            registers = false,
            spelling = {
                enabled = true,
                suggestions = 20,
            }
        }
    }

    wk.register({
        ["<leader>w"] = {
            name = "+window",
            h = {"<cmd>wincmd h<cr>", "Move Cursor to Left Window"},
            j = {"<cmd>wincmd j<cr>", "Move Cursor to Bottom Window"},
            k = {"<cmd>wincmd k<cr>", "Move Cursor to Top  Window"},
            l = {"<cmd>wincmd l<cr>", "Move Cursor to Right Window"},
            s = {"<cmd>split<cr>", "Horizontal Split"},
            v = {"<cmd>vsplit<cr>", "Vertical Split"},
        },
        ["<leader>b"] = {
            name = "+buffer",
            d = {"<cmd>bd<cr>", "Destroy Buffer"},
            s = {"<cmd>wa<cr>", "Write all Buffers"},
        },
        ["<leader>"] = {
            y = {'"+y', "Yank to clipboard"},
            q = {"<cmd>q<cr>", "Quit"},
            m = {"<cmd>call mkdir(expand(\"%:p:h\"), \"p\")<CR>", "Make current directory"}
        },
        ["<leader>f"] = {
            name = "+FZF",
            f = {"<cmd>Telescope find_files<cr>", "Search Files (Current Dir)"},
            b = {"<cmd>Telescope buffers<cr>", "Search Buffers"},
            l = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
            g = {"<cmd>Telescope git_files<cr>", "Search Git Files"},
        },
        ["<leader>l"] = {
            name = "+LSP",
            d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Definition"},
            f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Formatting"}
        },
        ["<leader>o"] = {
            name = "+Org-Mode",
            a = {"<cmd>lua require('orgmode').action('agenda.prompt')<cr>", "Open Org Agenda"},
            c = {"<cmd>lua require('orgmode').action('capture.prompt')<cr>", "Open Capture"},
        }
})
end

return M
