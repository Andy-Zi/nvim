return {
    "christoomey/vim-tmux-navigator",
    config = function()
        vim.api.nvim_set_keymap("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { noremap = true, silent = true })
    end,
}
