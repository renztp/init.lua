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
  end
}

