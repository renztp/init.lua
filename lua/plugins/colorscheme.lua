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
        transparent_background = true,
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
        inc_search = "underline",           -- underline | background
      })

      -- vim.cmd('colorscheme monokai-pro-ristretto')
    end
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require('kanagawa').setup({
        compile = false,             -- enable compiling the colorscheme
        undercurl = true,            -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,         -- do not set background color
        dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "dragon",              -- Load "wave" theme when 'background' option is not set
        background = {               -- map the value of 'background' option to a theme
          dark = "dragon",           -- try "dragon" !
          light = "lotus"
        }
      })
    end
  },
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'darker',
      }
    end
  }
}
