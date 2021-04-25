local utils = require('utils')
local map = utils.map

local opts = {noremap = true, silent = true}
map('n', '<leader>dtb', [[<cmd>lua require('dap').toggle_breakpoint()<cr>]],
    opts)
map('n', '<leader>dc', [[<cmd>lua require('dap').continue()<cr>]], opts)
map('n', '<leader>dso', [[<cmd>lua require('dap').step_over()<cr>]], opts)
map('n', '<leader>dsi', [[<cmd>lua require('dap').step_into()<cr>]], opts)
map('n', '<leader>dr', [[<cmd>lua require('dap').repl.open()<cr>]], opts)

local dap = require('dap')

dap.adapters.python = {
    type = 'executable',
    command = '/home/jb/.local/share/my-venvs/debugpy/bin/python',
    args = {'-m', 'debugpy.adapter'}
}
dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        console = 'integratedTerminal';

        program = "${file}"; -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python'
            end
        end;
    }
}
