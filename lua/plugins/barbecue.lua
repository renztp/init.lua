return {
  "utilyre/barbecue.nvim",
  enabled = false,
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",                 -- optional dependency
  },
  config = function()
    require("barbecue").setup({
      theme = 'monokai-pro'
    })
  end,
}
