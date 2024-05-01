return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'ayu_mirage',
      },
      section_separators = {left = '', right = ''},
      component_separators = {left = '|', right = '|'},
      sections = {
        lualine_a = { 'branch', },
        lualine_b = { 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    })
  end
}
