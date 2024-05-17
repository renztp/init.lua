return {
  'Mofiqul/vscode.nvim',
  config = function()
    require('vscode').setup({
      transparent = false,
      italic_comments = true,
      underline_links = true,
      disable_nvimtree_bg = false,
    })
  end
}

