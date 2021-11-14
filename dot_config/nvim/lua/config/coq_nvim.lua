local M = {}

function M.setup()
    local sources = {
        { src = "bc", short_name = "MATH", precision = 6 },
        { src = "repl", unsafe = { "rm", "sudo", "mv", "cp" } },
    }
    if vim.fn.executable "figlet" == 1 then
        table.insert(sources, { src = "figlet" })
    end
    if vim.fn.executable "cowsay" == 1 then
        table.insert(sources, { src = "cow" })
    end
    require "coq_3p"(sources)
end

return M