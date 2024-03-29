vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
-- this needs to be investigated
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/init.lua<CR>");

-- old
-- vim.keymap.set("n", "<leader><leader>ff", "<cmd>:NvimTreeFocus<CR>")
-- vim.keymap.set("n", "<leader><leader>fc", "<cmd>:NvimTreeFindFile<CR>")
-- vim.keymap.set("n", "<leader><leader>te", "<cmd>:NvimTreeToggle<CR>")
-- new
vim.keymap.set("n", "t", "<cmd>:NvimTreeFindFile<CR>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- add a keymap to move buffers using leader + w + h/j/k/l
vim.keymap.set("n", "<leader>wj", "<cmd>wincmd j<CR>")
vim.keymap.set("n", "<leader>wk", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<leader>wh", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<leader>wl", "<cmd>wincmd l<CR>")

-- add a keymap to close a buffer using leader + q with the bufdelete plugin
vim.keymap.set("n", "<leader>q", "<cmd>Bdelete<CR>")

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>")

vim.keymap.set("n", "<leader>dd", "<cmd>DiffviewOpen<CR>")

vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>Y", [["+Y]])
vim.keymap.set("v", "<leader>p", [["+p]])
vim.keymap.set("v", "<leader>P", [["+P]])

vim.keymap.set("n", "<F6>", "<cmd>term python3 %<CR>")
vim.keymap.set("n", "<F5>", "<cmd>CompileAndRunTS<CR>")

vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })
