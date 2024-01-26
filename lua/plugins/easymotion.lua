return {
	"easymotion/vim-easymotion",
	config = function()
		-- Disable default mappings
		vim.g.EasyMotion_do_mapping = 1

		-- Custom mappings
		vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-overwin-f2)", { noremap = false })

		-- Turn on case-insensitive feature
		vim.g.EasyMotion_smartcase = 1

		-- JK motions: Line motions
		vim.api.nvim_set_keymap("n", "<Leader>j", "<Plug>(easymotion-j)", { noremap = false })
		vim.api.nvim_set_keymap("n", "<Leader>k", "<Plug>(easymotion-k)", { noremap = false })
          local wk = require("which-key")
          wk.register({
            ["<Leader>j"] = { "<Plug>(easymotion-j)", "Find line below" },
            ["<Leader>k"] = { "<Plug>(easymotion-k)", "Find line above" },
          })
          wk.reregister({
               ["s"] = { "<Plug>(easymotion-overwin-f2)", "Find 2 characters" },
          })
	end,
}
