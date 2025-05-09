-- return {
--   -- {
--   --   "ThePrimeagen/harpoon",
--   --   branch = "harpoon2",
--   --   dependencies = { "nvim-lua/plenary.nvim" },
--   -- },
--   {
--     'theprimeagen/harpoon',
--     enabled = true,
--     config = function()
--       local mark = require("harpoon.mark")
--       local ui = require("harpoon.ui")
--
--       require("harpoon").setup({
--         menu = {
--           width = 150,
--         }
--       })
--
--       vim.keymap.set("n", "<leader>a", mark.add_file)
--       vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
--
--       vim.keymap.set("n", "<M-1>", function() ui.nav_file(1) end)
--       vim.keymap.set("n", "<M-2>", function() ui.nav_file(2) end)
--       vim.keymap.set("n", "<M-3>", function() ui.nav_file(3) end)
--       vim.keymap.set("n", "<M-4>", function() ui.nav_file(4) end)
--       vim.keymap.set("n", "<M-5>", function() ui.nav_file(5) end)
--       vim.keymap.set("n", "<M-6>", function() ui.nav_file(6) end)
--       vim.keymap.set("n", "<M-7>", function() ui.nav_file(7) end)
--       vim.keymap.set("n", "<M-8>", function() ui.nav_file(8) end)
--       vim.keymap.set("n", "<M-9>", function() ui.nav_file(9) end)
--       vim.keymap.set("n", "<M-0>", function() ui.nav_file(0) end)
--
--       vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
--       vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
--       vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
--       vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
--       vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
--       vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
--       vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end)
--       vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end)
--       vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end)
--       vim.keymap.set("n", "<leader>0", function() ui.nav_file(0) end)
--     end
--   }
-- }
-- return {
--   "theprimeagen/harpoon",
--     branch = "harpoon2",
--     dependencies = { "nvim-lua/plenary.nvim" },
--     config = function()
--       require("harpoon"):setup()
--     vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
--     vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

--     vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
--     vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
--     vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
--     vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
--     vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
--     vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
--     vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
--     vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
--     vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)
--     vim.keymap.set("n", "<leader>0", function() harpoon:list():select(0) end)
--   end
-- }
return {
  "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

-- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
    vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
    vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
    vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
    vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)
    vim.keymap.set("n", "<leader>0", function() harpoon:list():select(0) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<M-b>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<M-w>", function() harpoon:list():next() end)
  end
}
