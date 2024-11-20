vim.opt.guicursor = ""
vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = false
vim.syntax = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.conceallevel = 1

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scr = 8
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.splitright = true

vim.opt.updatetime = 50
vim.opt.cursorline = true
vim.opt.wrap = true

vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = false

-- vim.keymap.set('n', '<leader>ff', require('ufo').openAllFolds)

vim.opt.background = "dark"
--
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = a

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",     -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")


-- vimapi.nvim_create_autocmd('ColorScheme', {
--   command = [[highlight CursorLine guibg=NONE cterm=underline]]
-- })

-- ***************
-- --- KEYMAPS ---
-- ***************
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader><leader>q", "<cmd>cclose<CR>")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/init.lua<CR>");
vim.keymap.set("n", "<leader>q", "<cmd>Bdelete<CR>")

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>")

vim.keymap.set("n", "<leader>dvo", "<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>dvc", "<cmd>DiffviewClose<CR>")

vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>Y", [["+Y]])
vim.keymap.set("v", "<leader>p", [["+p]])
vim.keymap.set("v", "<leader>P", [["+P]])

vim.keymap.set("n", "<F6>", "<cmd>term python3 %<CR>")
vim.keymap.set("n", "<F5>", "<cmd>CompileAndRunTS<CR>")
-- vim.keymap.set("n", "<leader>fc", "<cmd>LspZeroFormat<CR>")
-- vim.api.nvim_set_keymap('n', '<C-d>',
--   "v:count == 0 ? 8 .. '<C-d>zz' : '<C-d>zz'",
--   { noremap = true, expr = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-u>',
--   "v:count == 0 ? 8 .. '<C-u>zz' : '<C-u>zz'",
--   { noremap = true, expr = true, silent = true })

vim.keymap.set("n", "<leader>dh", "<cmd>nohl<CR>")
vim.keymap.set("n", "<leader>cod", "<cmd>Copilot disable<CR>")
vim.keymap.set("n", "<leader>coa", "<cmd>Copilot enable<CR>")
-- vim.keymap.set("n", "gf", function()
--   if require("obsidian").util.cursor_on_markdown_link() then
--     return "<cmd>ObsidianFollowLink<CR>"
--   else
--     return "gf"
--   end
-- end, { noremap = false, expr = true })

vim.keymap.set("n", "<leader>gbt", "<cmd>GitBlameToggle<CR>")

vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {})
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
-- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {})
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {})
-- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', {})
vim.keymap.set('n', 'gi', '<cmd>Glance implementations<cr>', {})
vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', {})
-- vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, {})
vim.keymap.set('n', 'gr', '<cmd>Glance references<cr>', {})
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {})
vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', {})
vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', {})
vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', {})

vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', {})
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', {})
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', {})
vim.keymap.set("n", "<leader>cd", "<cmd>Copilot disable<CR>")
vim.keymap.set("n", "<leader>ce", "<cmd>Copilot enable<CR>")
vim.keymap.set("n", "<leader>ssl", "<cmd>vertical resize +30<CR>")
vim.keymap.set("n", "<leader>ssh", "<cmd>vertical resize -30<CR>")


vim.keymap.set('n', '<leader>du', "<cmd>DBUI<CR>")
vim.keymap.set('n', '<leader>di', "<cmd>DBUIToggle<CR>")

-- vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "open parent directory" })

-- vim.keymap.set("n", "<leader>fi", vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}}))

vim.keymap.set('n', '<C-f>', '/\\c')

-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
  augroup END
]]

-- restore the session for the current directory
-- vim.api.nvim_set_keymap("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})

-- restore the last session
-- vim.api.nvim_set_keymap("n", "<leader>ps", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})
-- vim.keymap.set('n', '<leader>ps', '<cmd>w<CR>')

-- stop Persistence => session won't be saved on exit
-- vim.api.nvim_set_keymap("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})

-- vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

vim.keymap.set('n', '<M-h>', "<cmd>bprev<CR>")
vim.keymap.set('n', '<M-l>', "<cmd>bnext<CR>")

vim.keymap.set('n', '<leader><leader>tn', '<cmd>tabnew<cr>')
vim.keymap.set('n', '<leader><leader>tc', '<cmd>tabclose<cr>')
vim.keymap.set('n', '<leader><leader>to', '<cmd>tabonly<cr>')
vim.keymap.set('n', '<leader><leader>tl', '<cmd>tabnext<cr>')
vim.keymap.set('n', '<leader><leader>th', '<cmd>tabprevious<cr>')

vim.keymap.set('n', '<leader>he', '<cmd>TSEnable highlight<cr>')
vim.keymap.set('n', '<leader>ps', '<cmd>w<CR>')
local diagnostics = {
  virtual_text = false,   -- Disable builtin virtual text diagnostic
  virtual_improved = {
    current_line = 'only',
  },
}
vim.diagnostic.config(diagnostics)

vim.keymap.set('n', '<leader>cf', function()
  local filepath = vim.fn.expand('%:p')
  local filename = vim.fn.fnamemodify(filepath, ':t')
  vim.fn.setreg('+', filename)
  print('Copied filename to clipboard: ' .. filename)
end)

vim.keymap.set('n', '<F9>', '<cmd>SymbolsOutline<CR>');
vim.keymap.set('n','<M-[>', '<C-w>30<')
vim.keymap.set('n','<M-]>', '<C-w>30>')

vim.api.nvim_command('au BufRead,BufNewFile *.njk set filetype=html')
vim.api.nvim_command('au BufRead,BufNewFile *.ejs set filetype=html')

vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to clipboard')
end, {})

vim.keymap.set('n', '<leader>cp', '<cmd>Cppath<CR>')
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    vim.wo.foldenable = false
  end,
})

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
vim.keymap.set('n', 'zP', function()
  require("ufo.preview"):peekFoldedLinesUnderCursor()
end)




-- Colorscheme
vim.api.nvim_create_autocmd('ColorScheme', {
  command = [[highlight CursorLine guibg=#333333 cterm=underline]]
})
-- vim.cmd [[colorscheme u]]
vim.cmd [[colorscheme kanagawa-dragon]]
-- vim.cmd [[colorscheme habamax]]
-- vim.cmd [[colorscheme nightfox]]


local lsp = vim.lsp.buf
local function copy_function_names()
  lsp.document_symbol({}, function(err, result, ctx)
    if err or not result then return end
    local function_names = {}
    for _, symbol in ipairs(result) do
      if symbol.kind == 6 then -- 12 is the LSP kind for functions
        table.insert(function_names, symbol.name)
      end
    end
    -- Yank function names to the unnamed register
    vim.fn.setreg('"', table.concat(function_names, "\n"))
    print("Yanked function names to unnamed register")
  end)
end

-- Call the function
vim.keymap.set('n', '<leader><leader>cf', copy_function_names)
vim.keymap.set('n', '<C-g>', ':', { noremap = false, silent = false })

-- Create an autocommand group to manage Copilot settings
vim.api.nvim_create_augroup("CopilotDisable", { clear = true })

-- Define the autocommand to disable Copilot for specific file types
-- vim.api.nvim_create_autocmd("FileType", {
--   group = "CopilotDisable",
--   pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
--   callback = function()
--     vim.b.copilot_enabled = false
--   end,
-- })

