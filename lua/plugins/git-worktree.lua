return {
	"polarmutex/git-worktree.nvim",
	config = function()
		require("telescope").load_extension("git_worktree")
		vim.keymap.set("n", "<leader>ga",
			"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
			{ desc = "[G]it worktree [A]dd", noremap = true, silent = true })
		vim.keymap.set("n", "<leader>gw",
			"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
			{ desc = "[G]it [W]orktree", noremap = true, silent = true })
	end,
}
