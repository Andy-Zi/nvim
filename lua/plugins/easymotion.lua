return {
	"easymotion/vim-easymotion",
	config = function()
		-- Disable default mappings
		vim.g.EasyMotion_do_mapping = 0
		-- Turn on case-insensitive feature
		vim.g.EasyMotion_smartcase = 1

		-- Custom mappings
		vim.api.nvim_set_keymap(
			"n",
			"<leader><leader>m",
			"<Plug>(easymotion-bd-f2)",
			{ desc = "Find 2 characters", noremap = false, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>m",
			"<Plug>(easymotion-bd-f)",
			{ desc = "Find 1 character", noremap = false, silent = true }
		)

	end,
}
