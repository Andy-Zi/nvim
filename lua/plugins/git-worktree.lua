return {
     "polarmutex/git-worktree.nvim",
     config = function()
          require("telescope").load_extension("git_worktree")
          vim.keymap.set("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>")
          local wk = require("which-key")
          wk.register({
               ["<leader>gw"] = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "Git Worktree" },
          })
     end,
}
