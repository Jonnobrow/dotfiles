vim.cmd([[
augroup Terraform
    autocmd BufEnter *.tf set ft=terraform
augroup end
augroup Jenkins
    autocmd BufNewFile,BufRead Jenkinsfile setf groovy
augroup end
]])
