return {
  'folke/which-key.nvim',
  enabled = false,
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 0

    require('which-key').setup({
      plugins = {
        marks = true,       -- shows a list of your marks on ' and `
        registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true,      -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true,      -- default bindings on <c-w>
          nav = true,          -- misc bindings to work with windows
          z = true,            -- bindings for folds, spelling and others prefixed with z
          g = true,            -- bindings for prefixed with g
        },
      },
      window = {
        border = "single",        -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 0, 2, 2, 180 },  -- extra window margin [top, right, bottom, left]
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
      },
      layout = {
        height = { min = 4, max = 25 },                                             -- min and max height of the columns
        width = { min = 20, max = 50 },                                             -- min and max width of the columns
        spacing = 3,                                                                -- spacing between columns
        align = "right",                                                           -- align columns left, center or right
      },
      ignore_missing = false,                                                       -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true,                                                             -- show help message on the command line when the popup is visible
      triggers = "auto",                                                            -- automatically setup triggers
    });

    local wk = require('which-key');
    wk.register({
      ["<leader>"] = {
        s = {
          name = "Search",
          h = {
            function()
              local searchWord = vim.fn.input("Search Word from highlighted: ")
              local visualSearch = "/\\%V"
              vim.cmd(visualSearch .. searchWord)
            end,
            "Search Highlight"
          },
          m = {
            function()
              local searchWord = vim.fn.input("Search for: ")
              vim.cmd(string.format("'a,'b/%s", searchWord))
            end,
            "Search String Between A & B marks"
          }
        },
        d = {
          name = "Delete",
          m = {
            function()
              vim.cmd("delmarks ab")
            end,
            "Delete Marks"
          }
        },
        c = {
          name = "Copy",
          f = {
            function()
              local filepath = vim.fn.expand('%:p')
              local filename = vim.fn.fnamemodify(filepath, ':t')
              vim.fn.setreg('+', filename)
              print('Copied filename to clipboard: ' .. filename)
            end,
            "Copy Filename"
          },
          p = {
            function()
              vim.cmd("let @+=expand('%:p')")
            end,
            "Copy Full Path"
          }
        },
      }
    })
  end
}
