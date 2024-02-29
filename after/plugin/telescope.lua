require('telescope').setup {
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      layout_strategy = 'vertical',
      wrap_results = true,
      lsp_references = {
        path_display = { "smart" },
      },
      layout_config = {
        width = 0.9,
        height = 0.6,
        prompt_position = "top",
        flex = {
          flip_columns = 130
        }
      }
    },
    git_files = {
      theme = "dropdown",
      previewer = false,
      layout_strategy = 'vertical',
      lsp_references = {
        path_display = { "smart" },
      },
      wrap_results = true,
      layout_config = {
        width = 0.9,
        height = 0.6,
        prompt_position = "top",
        flex = {
          flip_columns = 130
        }
      }
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      wrap_results = true,
      layout_config = {
        width = 0.9,
        height = 0.6,
        prompt_position = "top",
        flex = {
          flip_columns = 130
        }
      }
    },
    lsp_references = {
      theme = "ivy",
      layout_strategy = 'horizontal',
      show_line = false,
      path_display = { "smart" },
      wrap_results = true,
      layout_config = {
        width = 0.99,
        height = 0.99,
        prompt_position = "top",
        preview_width = 0.4,
      }
    },
    live_grep = {
      theme = "dropdown",
      layout_strategy = 'horizontal',
      show_line = false,
      path_display = { "smart" },
      wrap_results = true,
      layout_config = {
        width = 0.99,
        height = 0.99,
        prompt_position = "top",
        preview_width = 0.4,
      }
    },
  }
}
local builtin = require('telescope.builtin')
-- require('telescope').load_extension('projects')

-- vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<C-p>', builtin.find_files)
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>pp', "<cmd>Telescope builtin<CR>")
-- vim.keymap.set('n', '<leader>pS', function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)
vim.keymap.set('n', '<leader>pf', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- :let @+=expand('%:p')
vim.keymap.set('n', '<leader>cf', "<cmd>let @+=expand('%:p')<CR>")
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pl', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader><leader>pl', builtin.lsp_dynamic_workspace_symbols, {})
-- vim.keymap.set('n', '<leader>pr', "<cmd>Telescope projects<CR>")
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, {})
-- vim.keymap.set('n', '<leader>pl', require('telescope').extensions.projects, {})
vim.keymap.set('n', '<leader>fs', require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })
