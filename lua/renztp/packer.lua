-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'}, {"nvim-telescope/telescope-live-grep-args.nvim"} }
  }

  -- Colorscheme
  use { "bluz71/vim-moonfly-colors" }
  use { "folke/tokyonight.nvim" }
  use { "tiagovla/tokyodark.nvim" }
  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')

  -- File navigation
  use('theprimeagen/harpoon')

  -- Change history
  use('mbbill/undotree')

  -- Git integration
  use('tpope/vim-fugitive')

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}

-- Github copilot
use('github/copilot.vim')

-- use('nvim-tree/nvim-tree.lua')
use('nvim-tree/nvim-web-devicons')
use {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup()
    require("scrollbar.handlers.gitsigns").setup()
  end
}

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
-- get plugins to mimic vscode behaviour
use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}
use('tpope/vim-commentary')
use('tpope/vim-surround')
use({
  "utilyre/barbecue.nvim",
  tag = "*",
  requires = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  after = "nvim-web-devicons", -- keep this if you're using NvChad
  config = function()
    require("barbecue").setup()
  end,
})
-- using packer.nvim
use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
use("petertriho/nvim-scrollbar")

use {
  "kevinhwang91/nvim-hlslens",
  config = function()
    require("hlslens").setup({
       build_position_cb = function(plist, _, _, _)
            require("scrollbar.handlers.search").handler.show(plist.start_pos)
       end,
    })

    vim.cmd([[
        augroup scrollbar_search_hide
            autocmd!
            autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
        augroup END
    ]])
  end,
}

-- import the handlebar plugin
-- use 'mustache/vim-mustache-handlebars'
use { 'alexghergh/nvim-tmux-navigation', config = function()
  require'nvim-tmux-navigation'.setup {
    disable_when_zoomed = true, -- defaults to false
    keybindings = {
      left = "<C-h>",
      down = "<C-j>",
      up = "<C-k>",
      right = "<C-l>",
      last_active = "<C-\\>",
      next = "<C-Space>",
    }
  }
end
}

use 'famiu/bufdelete.nvim'

-- nvim v0.7.2
use({
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  requires = {
    "nvim-lua/plenary.nvim",
  },
})
use 'RRethy/vim-illuminate'
use { 'folke/which-key.nvim' , config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 0
  end
}
-- use 'xiyaowong/nvim-cursorword'

-- add the git-blame plugin
use 'f-person/git-blame.nvim'

-- install leap
use {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- you can configure Hop the way you like here; see :h hop-config
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
}
use {'stevearc/dressing.nvim'}
use 'sindrets/diffview.nvim'

-- vim multi select
use 'mg979/vim-visual-multi'

use "HiPhish/nvim-ts-rainbow2"

  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  use({
    "epwalsh/obsidian.nvim",
    tag = "*",  -- recommended, use latest release instead of latest commit
  })
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }
  -- Alternate file plugin
  -- use({
  --   "stevearc/oil.nvim",
  --   config = function()
  --     require("oil").setup()
  --   end,
  -- })
end)
