return {
  {
    'onsails/lspkind-nvim',
    config = function()
      require('lspkind').init({
        mode = 'symbol_text',
        -- present = 'codicons'
      })
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require "lsp_signature".setup({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        hint_prefix = "",
        hint_enable = false,
        handler_opts = {
          border = "rounded"
        }
      })
      vim.keymap.set({ 'n' }, '<C-k>', function()
        require('lsp_signature').toggle_float_win()
      end, { silent = true, noremap = true, desc = 'toggle signature' })
    end
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' }
    },
    lazy = false,
    -- init = function()
    --   -- Disable automatic setup, we are doing it manually
    --   vim.g.lsp_zero_extend_cmp = 0
    --   vim.g.lsp_zero_extend_lspconfig = 0
    -- end,
    config = function()
      local lsp_zero = require("lsp-zero")
      local lspconfig = require("lspconfig")

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      local function organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = ""
        }
        vim.lsp.buf.execute_command(params)
      end


      lspconfig.tsserver.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        commands = {
          OrganizeImports = {
            organize_imports,
            description = "Organize Imports"
          }
        }
      })

      lspconfig.svelte.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        commands = {
          OrganizeImports = {
            organize_imports,
            description = "Organize Imports"
          }
        }
      })

      -- lspconfig.emmet_ls.setup({
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      --   filetypes = { "html", "css", "javascriptreact", "typescriptreact", "php" },
      --   init_options = {
      --     html = {
      --       options = {
      --         ["bem.enabled"] = true
      --       }
      --     }
      --   }
      -- })

      local function format_and_organize_imports()
        vim.lsp.buf.format()
        vim.cmd("OrganizeImports")
      end

      -- format code
      vim.keymap.set("n", "<leader>fc", format_and_organize_imports, { desc = "Format and organize Imports" })
    end
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  -- Autocompletion
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node
      local return_filename = function()
        return vim.fn.expand("%:t")
      end

      ls.add_snippets("all", {
        s("hello", {
          t("Hello, "),
          i(1),
          t(". Nice to meet you!"),
        }),

        s("ccon", {
          t("console.log('zzzz||"),
          f(return_filename, {}),
          t("', "),
          i(1),
          t(");"),
        })
      })
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      require("luasnip.loaders.from_vscode").lazy_load()
      local cmp_action = lsp_zero.cmp_action()
      local lspkind = require('lspkind')

      cmp.setup({
        -- formatting = lsp_zero.cmp_format({ details = true }),
        formatting = {
          format = lspkind.cmp_format({
            -- mode = 'symbol', -- show only symbol annotations
            -- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- can also be a function to dynamically calculate max width such as
            -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            show_labelDetails = true, -- show labelDetails in menu. Disabled by default

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            -- before = function (entry, vim_item)
            --   ...
            --   return vim_item
            -- end
          })
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }),
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip' },
          { name = 'buffer' },
        }),
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()
      require('neodev').setup()

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require('mason-lspconfig').setup({
        ensure_installed = { "pyright" },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  }
}
