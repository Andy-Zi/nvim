return {
    "sindrets/diffview.nvim",
    config = function()
        vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<CR>',
            { noremap = true, silent = true, desc = '[G]it [O]pen DiffView' })
        vim.keymap.set('n', '<leader>gD', '<cmd>DiffviewClose<CR>',
            { noremap = true, silent = true, desc = '[G]it Close [D]iffView' })
        vim.keymap.set('n', '<leader>gn', '<cmd>DiffviewNext<CR>',
            { noremap = true, silent = true, desc = '[G]it [N]ext DiffView' })
        vim.keymap.set('n', '<leader>gp', '<cmd>DiffviewPrev<CR>',
            { noremap = true, silent = true, desc = '[G]it [P]revious DiffView' })
        vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<CR>',
            { noremap = true, silent = true, desc = '[G]it File [H]istory' })
    end,
}
