return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        update_focused_file = {
          enable = true,
        },
        sort_by = "case_sensitive",
        view = {
          width = 40,
        },
        renderer = {
          group_empty = true,
          indent_markers = {
            enable = true,
          },
          icons = {
            git_placement = "signcolumn",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          }
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 500
        },
        on_attach = "default",
      })
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.opt.termguicolors = true

      vim.keymap.set("n", "t", "<cmd>:NvimTreeFindFile<CR>")
      vim.keymap.set("n", "<leader>t", "<cmd>:NvimTreeToggle<CR>")
    end,
  },
  -- {
  --   'akinsho/bufferline.nvim',
  --   enabled = false,
  --   version = "*",
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons',
  --     'famiu/bufdelete.nvim'
  --   },
  --   config = function()
  --     require("bufferline").setup({
  --       options = {
  --         numbers = "none",
  --         close_command = "bdelete! %d",
  --         right_mouse_command = "bdelete! %d",
  --         left_mouse_command = "buffer %d",
  --         middle_mouse_command = nil,
  --         indicator_icon = '▎',
  --         buffer_close_icon = '',
  --         modified_icon = '●',
  --         close_icon = '',
  --         left_trunc_marker = '',
  --         right_trunc_marker = '',
  --         name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
  --           if buf.name:match('%.md') then
  --             return vim.fn.fnamemodify(buf.name, ':t:r')
  --           end
  --         end,
  --         max_name_length = 50,
  --         max_prefix_length = 15, -- prefix used when a buffer is deduplicated
  --         tab_size = 18,
  --         diagnostics = false,
  --         diagnostics_indicator = function(count, level, diagnostics_dict, context)
  --           return "(" .. count .. ")"
  --         end,
  --         -- indicator = {
  --         --   icon = '▎', -- this should be omitted if indicator style is not 'icon'
  --         --   style = 'underline',
  --         -- },
  --         offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
  --         show_buffer_icons = true,
  --         show_buffer_close_icons = true,
  --         show_close_icon = true,
  --         show_tab_indicators = true,
  --         persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
  --         separator_style = "slant",
  --         enforce_regular_tabs = false,
  --         always_show_bufferline = true,
  --         sort_by = 'id',
  --         highlights = {
  --           -- buffer_visible = {
  --           --   fg = "#ffffff",
  --           --   bg = "#ffffff"
  --           -- },
  --           -- buffer_selected = {
  --           --   fg = "#ffffff",
  --           --   bg = "#ffffff",
  --           -- },
  --           background = {
  --             fg = "#000000",
  --             bg = "#000000"
  --           },
  --           tab_separator = {
  --             fg = "#000000",
  --             bg = "#000000"
  --           },
  --           separator = {
  --             fg = "#000000",
  --             bg = "#000000"
  --           },
  --         }
  --       }
  --     })
  --     vim.keymap.set('n', '<M-h>', "<cmd>bprev<CR>")
  --     vim.keymap.set('n', '<M-l>', "<cmd>bnext<CR>")
  --
  --     vim.keymap.set('n', '<leader><leader>h', "<cmd>BufferLineMovePrev<CR>")
  --     vim.keymap.set('n', '<leader><leader>l', "<cmd>BufferLineMoveNext<CR>")
  --   end
  -- },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
