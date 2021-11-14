require("which-key").register({
    ["<leader>g"] = {
        name = "+git",
        s = {"<cmd>Git<cr>", "Git Status"},
        r = {"<cmd>Gread<cr>", "Git Read, Restores File from HEAD"},
        b = {"<cmd>Git blame<cr>", "Git blame"},
        a = {"<Plug>(GitGutterStageHunk)", "Stage Hunk"},
        u = {"<Plug>(GitGutterUndoHunk)", "Undo Hunk"}
    },
    ["g"] = {
        j = {"<Plug>(GitGutterNextHunk)", "Next Git Gutter Hunk"},
        k = {"<Plug>(GitGutterPrevHunk)", "Previous Git Gutter Hunk"},
    }
})
