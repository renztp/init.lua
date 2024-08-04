return {
  {
    'Mofiqul/vscode.nvim',
    enabled = true,
    config = function()
      require('vscode').setup({
        transparent = false,
        italic_comments = true,
        underline_links = true,
        disable_nvimtree_bg = false,
      })
    end
  },
  {
    'loctvl842/monokai-pro.nvim',
    lazy = false,
    config = function()
      require('monokai-pro').setup({
        transparent_background = false,
        terminal_colors = true,
        devicons = true, -- highlight the icons of `nvim-web-devicons`
        styles = {
          comment = { italic = true },
          keyword = { italic = true },       -- any other keyword
          type = { italic = true },          -- (preferred) int, long, char, etc
          storageclass = { italic = true },  -- static, register, volatile, etc
          structure = { italic = true },     -- struct, union, enum, etc
          parameter = { italic = true },     -- parameter pass in function
          annotation = { italic = true },
          tag_attribute = { italic = true }, -- attribute of tag in reactjs
        },
        inc_search = "background",           -- underline | background
      })

      -- vim.cmd('colorscheme monokai-pro-ristretto')
    end
  },
  {
    "rebelot/kanagawa.nvim",
  }
}
