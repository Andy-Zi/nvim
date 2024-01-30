return {
	"polarmutex/git-worktree.nvim",
	config = function()
		require("telescope").load_extension("git_worktree")
		vim.keymap.set("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", {desc = "Git Worktree add", noremap = true, silent = true})
        vim.keymap.set("n", "<leader>gc", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", {desc = "Git Worktree change", noremap = true, silent = true})
	end,
}
