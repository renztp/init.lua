return {
  {
    'ThePrimeagen/git-worktree.nvim'
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
      require("scrollbar.handlers.gitsigns").setup()
      vim.keymap.set('n', '<leader>.', "<cmd>Gitsigns next_hunk<CR>")
      vim.keymap.set('n', '<leader>,', "<cmd>Gitsigns prev_hunk<CR>")
    end,
  }
}
