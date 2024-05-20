return {
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
  }
}
