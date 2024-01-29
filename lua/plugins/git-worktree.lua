return {
	"polarmutex/git-worktree.nvim",
	config = function()
		require("telescope").load_extension("git_worktree")
		vim.keymap.set("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>")
        vim.keymap.set("n", "<leader>gc", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>")
		local wk = require("which-key")
		wk.register({
			["<leader>gw"] = {
				"<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
				"Git Worktree add",
			},
			["<leader>gc"] = {
				"<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
				"Git Worktree change",
			},
		})
	end,
}
