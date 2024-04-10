return {
  "epwalsh/obsidian.nvim",
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "work",
          path = "/home/renzpulvira/Dropbox/notes/",
        },
        {
          name = "study",
          path = "/home/renzpulvira/Dropbox/Study/",
        }
      },
    })

    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        o = {
          name = "Obsidian",
          i = {
            "<cmd>ObsidianPasteImg<CR>",
            "Paste Image"
          },
          t = {
            "<cmd>ObsidianTags<CR>",
            "Tags"
          }
        },
      },
    })
  end
}

