vim.cmd([[
augroup Terraform
    autocmd BufEnter *.tf set ft=terraform
augroup end
]])
