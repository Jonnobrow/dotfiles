Command.cmd({
  -- automatically change local file directory
  'autocmd BufEnter * silent! lcd %:p:h',
})
