vim.api.nvim_exec(
[[
fun! ApplyColorTheme()
    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif

   colorscheme spaceduck
endfun

call ApplyColorTheme()
]], true
)
