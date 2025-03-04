return {
  {
    "bassamsdata/namu.nvim",
    config = function()
      require("namu").setup({
        -- Enable the modules you want
        namu_symbols = {
          enable = true,
          options = {}, -- here you can configure namu
        },
        -- Optional: Enable other modules if needed
        ui_select = { enable = false }, -- vim.ui.select() wrapper
        colorscheme = {
          enable = false,
          options = {
            -- NOTE: if you activate persist, then please remove any vim.cmd("colorscheme ...") in your config, no needed anymore
            persist = true, -- very efficient mechanism to Remember selected colorscheme
            write_shada = false, -- If you open multiple nvim instances, then probably you need to enable this
          },
        },
      })
      -- === Suggested Keymaps: ===
      vim.keymap.set("n", "<leader>ss",":Namu symbols<cr>" , {
        desc = "Jump to LSP symbol",
        silent = true,
      })
      vim.keymap.set("n", "<leader>th", ":Namu colorscheme<cr>", {
        desc = "Colorscheme Picker",
        silent = true,
      })
    end,
  },
  {"NStefan002/screenkey.nvim"},
  {
    "OXY2DEV/markview.nvim",
    enabled = false,
    lazy = false,      -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    }
  },
  {
    'dnlhc/glance.nvim',
    config = function()
      require('glance').setup({
        height = 26, -- Height of the window
        border = {
          enable = false, -- Show window borders. Only horizontal borders allowed
          top_char = '―',
          bottom_char = '―',
        },
        list = {
          position = 'right', -- Position of the list window 'left'|'right'
          width = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
        },
        theme = { -- This feature might not work properly in nvim-0.7.2
          enable = true, -- Will generate colors for the plugin based on your current colorscheme
          mode = 'auto', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
        },
      })
    end
  },
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
    'smoka7/hop.nvim',
    version = "*",
    config = function()
      local hop = require('hop').setup()
      vim.keymap.set('n', '<leader><leader>w', '<cmd>HopWordAC<cr>')
      vim.keymap.set('v', '<leader><leader>w', '<cmd>HopWordAC<cr>')
      vim.keymap.set('n', '<leader><leader>b', '<cmd>HopWordBC<cr>')
      vim.keymap.set('v', '<leader><leader>b', '<cmd>HopWordBC<cr>')
    end
  },
  {
    'mattn/emmet-vim',
    config = function()
    end
  },
  {
    'akinsho/toggleterm.nvim',
    enabled = false,
    version = "*",
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<F8>]],
        float_opts = {
          border = 'single',
        }
      }
      local trim_spaces = true
      vim.keymap.set("v", "<space>s", function()
        require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
      end)
      require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = vim.v.count })
      require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
      vim.keymap.set("n", [[<leader><c-\>]], function()
        set_opfunc(function(motion_type)
          require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
        end)
        vim.api.nvim_feedkeys("g@", "n", false)
      end)
      -- Double the command to send line to terminal
      vim.keymap.set("n", [[<leader><c-\><c-\>]], function()
        set_opfunc(function(motion_type)
          require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
        end)
        vim.api.nvim_feedkeys("g@_", "n", false)
      end)
      -- Send whole file
      vim.keymap.set("n", [[<leader><leader><c-\>]], function()
        set_opfunc(function(motion_type)
          require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
        end)
        vim.api.nvim_feedkeys("ggg@G''", "n", false)
      end)
    end
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    config = function()

      require("outline").setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end
  },
  {
    'simrat39/symbols-outline.nvim',
    enabled = false,
    config = function()
      require('symbols-outline').setup({})
    end
  },
  {
    "mistricky/codesnap.nvim",
    build = "make",
    config = function()
      require("codesnap").setup({
        show_workspace = true,
        has_breadcrumbs = true,
        has_line_number = true,
        bg_color = "#535c68",
        bg_padding = 20,
        mac_window_bar = false,
        code_font_family = "Fira Mono",
        watermark = "",
        min_width = 100,
      })
    end
  },
  {
    "karb94/neoscroll.nvim",
    enabled = true,
    config = function()
      local neoscroll = require('neoscroll')
      neoscroll.setup({
        mappings = { -- Keys to be mapped to their corresponding default scrolling animation
          '<C-u>', '<C-d>',
          '<C-b>', '<C-f>',
          '<C-y>', '<C-e>',
          'zt', 'zz', 'zb',
        },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing = 'linear',            -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
        performance_mode = false,    -- Disable "Performance Mode" on all buffers.
      })
      local keymap = {
        ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 100, easing = 'quintic' }) end,
        ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 100, easing = 'quintic' }) end,
      }
      local modes = { 'n', 'v', 'x' }
      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end
    end
  },
  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
        end
      })
    end
  },
  { "meznaric/key-analyzer.nvim", opts = {} },
  {
    "epwalsh/obsidian.nvim",
    enabled = true,
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Brain",
        },
      },
      -- see below for full list of options 👇
    },
  }
}
