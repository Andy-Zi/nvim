--[[ return {
	"easymotion/vim-easymotion",
	config = function()
		-- Disable default mappings
		vim.g.EasyMotion_do_mapping = 0

		-- Custom mappings
		vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-overwin-f2)", { noremap = false })

		-- Turn on case-insensitive feature
		vim.g.EasyMotion_smartcase = 1

		-- JK motions: Line motions
		vim.api.nvim_set_keymap("n", "<Leader>j", "<Plug>(easymotion-j)", { noremap = false })
		vim.api.nvim_set_keymap("n", "<Leader>k", "<Plug>(easymotion-k)", { noremap = false })
	end,
} ]]
return {}
