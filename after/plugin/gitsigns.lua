require('gitsigns').setup()

vim.keymap.set('n', '<leader>.',"<cmd>Gitsigns next_hunk<CR>")
vim.keymap.set('n', '<leader>,',"<cmd>Gitsigns prev_hunk<CR>")
