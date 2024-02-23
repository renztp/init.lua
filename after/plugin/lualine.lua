require('lualine').setup({
  options = {
    theme = 'auto',
  },
   sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'diff','encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})
