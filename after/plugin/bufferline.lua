require("bufferline").setup{
  options = {
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 50,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    diagnostics = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'id'
  }
}

-- vim.keymap.set('n', '<leader>h', "<cmd>bprev<CR>")
-- vim.keymap.set('n', '<leader>l', "<cmd>bnext<CR>")
-- vim.keymap.set('n', '<M-h>', "<cmd>bprev<CR>")
-- vim.keymap.set('n', '<M-l>', "<cmd>bnext<CR>")
vim.keymap.set('n', 'gh', "<cmd>bprev<CR>")
vim.keymap.set('n', 'gl', "<cmd>bnext<CR>")
