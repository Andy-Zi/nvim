return {
	"rmagatti/auto-session",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").load_extension("session-lens")
		end,
	},
	config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_save_enable = true,
			auto_restore_enabled = true,
			auto_session_use_git_branch = true,
		})
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		vim.keymap.set(
			"n",
			"<leader>sS",
			require("auto-session.session-lens").search_session,
			{ desc = "[S]earch nvim [S]ession", silent = true, noremap = true }
		)
	end,
}
