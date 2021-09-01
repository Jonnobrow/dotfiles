require('neogit').setup { 
    disable_commit_confirmation = true,
    disable_signs = true }

require('which-key').register({
    ["<leader>g"] = {
        name = "+git",
        s = {"<cmd>Neogit<cr>", "Neogit Status"}
    }
})
