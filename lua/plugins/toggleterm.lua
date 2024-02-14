return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-a-\>]],
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 1,
			start_in_insert = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 3,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
		local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true })

		function _lazygit_toggle()
			lazygit:toggle()
		end
		function _lazydocker_toggle()
			lazydocker:toggle()
		end

		vim.api.nvim_set_keymap(
			"n",
			"<leader>gl",
			"<cmd>lua _lazygit_toggle()<CR>",
			{ desc = "LazyGit", noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>dl",
			"<cmd>lua _lazydocker_toggle()<CR>",
			{ desc = "LazyDocker", noremap = true, silent = true }
		)
	end,
}
