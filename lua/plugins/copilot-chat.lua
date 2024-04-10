return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },    -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = false,                     -- Enable debugging
      model = 'gpt-4',                  -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
      temperature = 0.1,                -- GPT temperature

      question_header = '',             -- Header to use for user questions
      answer_header = '**Copilot** ',   -- Header to use for AI answers
      error_header = '**Error** ',      -- Header to use for errors
      separator = '---',                -- Separator to use in chat

      show_folds = true,                -- Shows folds for sections in chat
      show_help = true,                 -- Shows help message as virtual lines when waiting for user input
      auto_follow_cursor = true,        -- Auto-follow cursor in chat
      auto_insert_mode = false,         -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
      clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
      window = {
        layout = 'float',
        relative = 'cursor',
        width = 1,
        height = 0.4,
        row = 1
      }
    },
  },
}
