return {
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add any options here
  --   },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   },
  --   config = function()
  --     local notify = require("notify")
  --     require("noice").setup({
  --       lsp = {
  --         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --         override = {
  --           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --           ["vim.lsp.util.stylize_markdown"] = true,
  --           ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
  --         },
  --         signature = {
  --           enabled = false
  --         },
  --       },
  --       -- you can enable a preset for easier configuration
  --       presets = {
  --         bottom_search = true,         -- use a classic bottom cmdline for search
  --         command_palette = true,       -- position the cmdline and popupmenu together
  --         long_message_to_split = true, -- long messages will be sent to a split
  --         inc_rename = false,           -- enables an input dialog for inc-rename.nvim
  --         lsp_doc_border = true,        -- add a border to hover docs and signature help
  --       },
  --     })
  --
  --     notify.setup({
  --       timeout = 3800,
  --       background = true,
  --       render = "wrapped-compact",
  --       stages = "static",
  --     })
  --   end
  -- },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  },
  {
    'tpope/vim-surround'
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup({
        build_position_cb = function(plist, _, _, _)
          require("scrollbar.handlers.search").handler.show(plist.start_pos)
        end,
      })

      vim.cmd([[
    augroup scrollbar_search_hide
    autocmd!
    autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
    augroup END
    ]])
    end,
  },
  { 'RRethy/vim-illuminate' },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  -- {
  --   'tpope/vim-commentary'
  -- },
  {
    'opdavies/toggle-checkbox.nvim',
    config = function()
      vim.keymap.set("n", "<leader>cb", ":lua require('toggle-checkbox').toggle()<CR>")
      vim.keymap.set("n", "<leader>cc", ":normal i- [ ] <Esc>A")
    end
  },
  {
    'backdround/global-note.nvim',
    config = function()
      local global_note = require("global-note")
      global_note.setup()

      vim.keymap.set("n", "<leader>gn", global_note.toggle_note, {
        desc = "Toggle global note",
      })
    end
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },
  {
    'smoka7/hop.nvim',
    version = "*",
    config = function()
      local hop = require('hop').setup()
      vim.keymap.set('n', '<leader><leader>w', '<cmd>HopWordAC<cr>')
      vim.keymap.set('v', '<leader><leader>w', '<cmd>HopWordAC<cr>')
      vim.keymap.set('n', '<leader><leader>b', '<cmd>HopWordBC<cr>')
      vim.keymap.set('v', '<leader><leader>b', '<cmd>HopWordBC<cr>')
    end
  }
}
