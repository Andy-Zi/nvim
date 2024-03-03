return {
	"tpope/vim-fugitive",
	config = function()
            vim.keymap.set('n', '<leader>gu', '<cmd>Gvsplit<CR>',
                { noremap = true, silent = true, desc = '[G]it show [U]nchanged' })
            vim.keymap.set('n', '<leader>gc', '<cmd>Gdiffsplit<CR>',
                { noremap = true, silent = true, desc = '[G]it show [C]hanged' })
	end,
}
