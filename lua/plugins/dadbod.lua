return {
	"tpope/vim-dadbod",
	opt = true,
	dependencies = {
		{
			"kristijanhusak/vim-dadbod-ui",
			dependencies = {
				{ "tpope/vim-dadbod", lazy = true },
				{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
			},
			cmd = {
				"DBUI",
				"DBUIToggle",
				"DBUIAddConnection",
				"DBUIFindBuffer",
			},
			init = function()
				-- Your DBUI configuration
				vim.g.db_ui_use_nerd_fonts = 1
			end,
		},
		{
			"kristijanhusak/vim-dadbod-completion",
			config = function()
				vim.api.nvim_create_autocmd("FileType", {
					pattern = { "sql", "mysql", "plsql" },
					callback = function()
						require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
					end,
				})
			end,
		},
	},
	config = function()
		vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>")
		local wk = require("which-key")
		wk.register({
			["<leader>db"] = { ":DBUIToggle<CR>", "DBUI" },
		})
        vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. ".db_ui"
	end,
}
