return {
  'Mofiqul/vscode.nvim',
  config = function()
    require('vscode').setup({
      transparent = true,
      italic_comments = true,
      underline_links = true,
      disable_nvimtree_bg = true,
    })
  end
}

