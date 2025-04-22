return {
  {
    "alexxGmZ/e-ink.nvim",
    priority = 1000,
    config = function ()
      require("e-ink").setup()

      -- choose light mode or dark mode
      -- vim.opt.background = "dark"
      -- vim.opt.background = "light"
      --
      -- or do
      -- :set background=dark
      -- :set background=light
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      -- Default options:
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
    end
  },
  {
    'Mofiqul/vscode.nvim',
    enabled = false,
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
    enabled = false,
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
    lazy = false,
    config = function()
      require('kanagawa').setup({
        compile = false,             -- enable compiling the colorscheme
        undercurl = true,            -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = { italic = true, bold = true },
        keywordStyle = { },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,         -- do not set background color
        dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave",              -- Load "wave" theme when 'background' option is not set
        background = {               -- map the value of 'background' option to a theme
          dark = "wave",           -- try "dragon" !
          light = "lotus"
        }
      })

      local colorscheme = "kanagawa-wave"

      local status_ok = pcall(vim.cmd, "colorscheme " .. colorscheme)
      if not status_ok then
        vim.cmd("colorscheme " .. colorscheme)
        return
      end
    end
  },
  {
    'navarasu/onedark.nvim',
    enabled = false,
    config = function()
      require('onedark').setup {
        style = 'darker',
      }
    end
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("solarized-osaka").setup({
        transparent = false,
      })
    end
  },
  {
    'NLKNguyen/papercolor-theme'
  }
  -- {
  --   "jackplus-xyz/binary.nvim",
  --   opts = {
  --     -- Add your configuration here
  --   }
  -- }
}
