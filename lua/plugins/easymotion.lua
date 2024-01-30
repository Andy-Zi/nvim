return {
	"easymotion/vim-easymotion",
	config = function()
		-- Disable default mappings
		vim.g.EasyMotion_do_mapping = 0

		-- Custom mappings
		vim.api.nvim_set_keymap(
			"n",
			"<leader>s",
			"<Plug>(easymotion-overwin-f2)",
			{ desc = "Find 2 characters", noremap = false, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"s",
			"<Plug>(easymotion-overwin-f)",
			{ desc = "Find 1 character", noremap = false, silent = true }
		)

		-- Turn on case-insensitive feature
		vim.g.EasyMotion_smartcase = 1

		-- JK motions: Line motions
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>j",
			"<Plug>(easymotion-j)",
			{ desc = "Find line below", noremap = false, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>k",
			"<Plug>(easymotion-k)",
			{ desc = "Find line above", noremap = false, silent = true }
		)
	end,
}
