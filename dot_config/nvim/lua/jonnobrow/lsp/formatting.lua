local M = {}

M.autoformat = true

function M.toggle()
  M.autoformat = not M.autoformat
  if M.autoformat then
    vim.notify("enabled format on save", vim.log.levels.INFO, {title="Formatting"})
  else
    vim.notify("disabled format on save", vim.log.levels.WARN, {title="Formatting"})
  end
end

function M.format()
  if M.autoformat then
    vim.lsp.buf.formatting_sync(nil, 2000)
  end
end

function M.setup(client, buf)
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
  local nls = require("jonnobrow.lsp.null-ls")

  local enable = false
  if nls.has_formatter(ft) then
    enable = client.name == "null-ls"
  else
    enable = not (client.name == "null-ls")
  end

  client.resolved_capabilities.document_formatting = enable
  -- format on save
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
      augroup LspFormat
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua require("jonnobrow.lsp.formatting").format()
      augroup END
    ]])
  end
end

return M
