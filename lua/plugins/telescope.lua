vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function(ctx)
		vim.api.nvim_buf_call(ctx.buf, function()
			vim.fn.matchadd("TelescopeParent", "\t\t.*$")
			vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
		end)
	end,
})

local function filenameFirst(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then
		return tail
	end
	return string.format("%s\t\t%s", tail, parent)
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.7",
	dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } },
	config = function()
		local lga_actions = require("telescope-live-grep-args.actions")

		require("telescope").setup({
			pickers = {
				current_buffer_fuzzy_find = {
					theme = "dropdown",
					layout_strategy = "horizontal",
					show_line = false,
					path_display = filenameFirst,
					wrap_results = true,
					layout_config = {
						width = 0.99,
						height = 0.99,
						prompt_position = "top",
						preview_width = 0.6,
					},
				},
				find_files = {
					theme = "dropdown",
					previewer = false,
					-- layout_strategy = 'vertical',
					wrap_results = true,
					path_display = filenameFirst,
					lsp_references = {
						path_display = { "smart" },
					},
					layout_config = {
						width = 0.45,
						height = 0.60,
						-- prompt_position = "top",
						-- preview_width = 0.4,
					},
					-- layout_config = {
					--   -- bottom_pane = {
					--   --   height = 25
					--   -- },
					--   -- width = 0.9,
					--   -- height = 0.6,
					--   -- prompt_position = "top",
					--   -- flex = {
					--   --   flip_columns = 130
					--   -- }
					-- }
				},
				git_status = {
					theme = "ivy",
					previewer = false,
					-- layout_strategy = 'vertical',
					wrap_results = true,
					path_display = filenameFirst,
					lsp_references = {
						path_display = { "smart" },
					},
					layout_config = {
						-- width = 0.99,
						-- height = 0.99,
						-- prompt_position = "top",
						-- preview_width = 0.4,
					},
					-- layout_config = {
					--   -- bottom_pane = {
					--   --   height = 25
					--   -- },
					--   -- width = 0.9,
					--   -- height = 0.6,
					--   -- prompt_position = "top",
					--   -- flex = {
					--   --   flip_columns = 130
					--   -- }
					-- }
				},
				git_files = {
					theme = "dropdown",
					previewer = false,
					layout_strategy = "vertical",
					lsp_references = {
						path_display = { "smart" },
					},
					wrap_results = true,
					layout_config = {
						width = 0.9,
						height = 0.6,
						prompt_position = "top",
						flex = {
							flip_columns = 130,
						},
					},
				},
				buffers = {
					theme = "ivy",
					previewer = false,
					wrap_results = true,
					path_display = filenameFirst,
					layout_config = {
						-- width = 0.99,
						-- height = 0.99,
						-- prompt_position = "top",
						preview_width = 0.4,
					},
					-- layout_config = {
					--   width = 0.9,
					--   height = 0.6,
					--   prompt_position = "top",
					--   flex = {
					--     flip_columns = 130
					--   }
					-- }
				},
				lsp_references = {
					theme = "ivy",
					layout_strategy = "horizontal",
					show_line = false,
					path_display = filenameFirst,
					wrap_results = true,
					layout_config = {
						width = 0.99,
						height = 0.60,
						prompt_position = "top",
						preview_width = 0.6,
					},
				},
				live_grep = {
					theme = "ivy",
					show_line = false,
					path_display = filenameFirst,
					wrap_results = true,
					layout_config = {
						-- width = 0.99,
						-- height = 0.99,
						-- prompt_position = "top",
						preview_width = 0.4,
					},
				},
				-- live_grep = {
				--   theme = "dropdown",
				--   layout_strategy = 'horizontal',
				--   show_line = false,
				--   path_display = filenameFirst,
				--   wrap_results = true,
				--   layout_config = {
				--     width = 0.99,
				--     height = 0.99,
				--     prompt_position = "top",
				--     preview_width = 0.4,
				--   }
				-- },
				lsp_document_symbols = {
					theme = "dropdown",
					layout_strategy = "horizontal",
					show_line = false,
					path_display = filenameFirst,
					wrap_results = true,
					layout_config = {
						width = 0.99,
						height = 0.99,
						prompt_position = "top",
						preview_width = 0.6,
					},
				},
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true,
					theme = "dropdown",
					layout_strategy = "horizontal",
					show_line = false,
					path_display = filenameFirst,
					wrap_results = true,
					layout_config = {
						width = 0.99,
						height = 0.85,
						prompt_position = "top",
						preview_width = 0.4,
					},
					mappings = {
						i = {
							["<C-s>"] = lga_actions.quote_prompt({ postfix = " --glob 'suitespot-settings-ui/**'" }),
							["<C-a>"] = lga_actions.quote_prompt({ postfix = " --glob 'suitespot-admin-ui/**'" }),
							["<C-space>"] = lga_actions.to_fuzzy_refine,
						},
					},
				},
			},
		})
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<C-p>", builtin.find_files)
		vim.keymap.set("n", "<leader>pg", builtin.git_status, {})
		vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
		vim.keymap.set("n", "<leader><leader>p", "<cmd>Telescope builtin<CR>")
		vim.keymap.set("n", "<leader>pp", builtin.commands, {})
		vim.keymap.set("n", "<leader>pf", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>faib", ":lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>")

		-- vim.keymap.set('n', '<M-s>', builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>pl", builtin.lsp_document_symbols, {})
		-- vim.keymap.set('n', '<leader><leader>p', builtin.lsp_dynamic_workspace_symbols, {})
		vim.keymap.set("n", "<C-f>", builtin.current_buffer_fuzzy_find, {})
		vim.keymap.set("n", "<leader>fs", telescope.extensions.live_grep_args.live_grep_args, { noremap = true })
		-- vim.keymap.set("n", "<leader>fo", telescope.extensions.live_grep_args.live_grep_args, { noremap = true })
		vim.keymap.set("n", "<leader>gws", telescope.extensions.git_worktree.git_worktrees, { noremap = true })
		vim.keymap.set("n", "<leader>gwc", telescope.extensions.git_worktree.create_git_worktree, { noremap = true })
		vim.keymap.set("n", "<leader><leader>gwd", require("git-worktree").delete_worktree, { noremap = true })
		vim.keymap.set("n", "gr", builtin.lsp_references, {})

		--set line number to the preview window
		vim.cmd("autocmd User TelescopePreviewerLoaded setlocal number")
	end,
}
