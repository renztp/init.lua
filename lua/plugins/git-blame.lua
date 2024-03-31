return {
  'f-person/git-blame.nvim',
  config = function()
    require('gitblame').setup({
      enabled = false,
      date_format = '%r %B %d %Y',
    })
  end
}
