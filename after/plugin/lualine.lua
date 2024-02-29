require('lualine').setup({
  options = {
    theme = 'auto',
  },
   sections = {
    lualine_a = {'branch'},
    lualine_b = {'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'diff','encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})

-- test
