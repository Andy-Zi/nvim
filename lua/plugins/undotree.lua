return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[U]ndo Tree", noremap = true, silent = true })
		vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
		vim.opt.undofile = true
		vim.opt.undolevels = 10000
		vim.g.undotree_WindowLayout = 2
	end,
}
