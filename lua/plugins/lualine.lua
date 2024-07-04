return {
  {
    'f-person/git-blame.nvim',
    config = function()
      require('gitblame').setup({
        enabled = false,
        date_format = '%r %B %d %Y',
      })
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'famiu/bufdelete.nvim',
      opt = true
    },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'codedark',
          globalstatus = true,
        },
        -- section_separators = { left = ' ', right = ' ' },
        -- component_separators = { left = ' ', right = ' ' },
        sections = {
          lualine_a = { 'branch', },
          lualine_b = { 'diagnostics' },
          lualine_c = { {
            'filename',
            path = 4
          } },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        -- winbar = {
        --   lualine_a = {},
        --   lualine_b = {},
        --   lualine_c = { {
        --     'filename',
        --     path = 1,
        --   } },
        --   lualine_x = {},
        --   lualine_y = {},
        --   lualine_z = {}
        -- },
        -- inactive_winbar = {
        --   lualine_a = {},
        --   lualine_b = {},
        --   lualine_c = { {
        --     'filename',
        --     path = 4,
        --   } },
        --   lualine_x = {},
        --   lualine_y = {},
        --   lualine_z = {}
        -- },
        tabline = {
          lualine_a = { {
            'buffers',
            show_filename_only = true,
            mode = 0,
            filetype_names = {
              TelescopePrompt = 'Telescope',
              dashboard = 'Dashboard',
              packer = 'Packer',
              fzf = 'FZF',
              alpha = 'Alpha',
              oil = 'Oil',
            },
          } },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = { 'diff' },
          lualine_z = { 'tabs' }
        }
      })
    end
  }
}
