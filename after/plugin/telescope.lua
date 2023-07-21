require('telescope').setup{
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      layout_strategy = 'vertical',
      layout_config = {
        width = 0.5,
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
      layout_config = {
        width = 0.5,
        height = 0.6,
        prompt_position = "top",
        flex = {
          flip_columns = 130
        }
      }
    },
    buffers = {
      theme = "dropdown",
      previewer = false
    },
    lsp_references = {
      layout_strategy = 'horizontal',
      show_line = false,
      path_display = { "absolute" },
      layout_config = {
        width = 0.9,
        height = 0.7,
        prompt_position = "top",
      }
    },
  }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>P', "<cmd>Telescope builtin<CR>")
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>pS', builtin.live_grep, {})
-- :let @+=expand('%:p')
vim.keymap.set('n', '<leader>cf', "<cmd>let @+=expand('%:p')<CR>")
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>pl', builtin.lsp_document_symbols, {})
