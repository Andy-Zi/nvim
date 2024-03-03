return { -- Start of the plugin configuration block
	-- The main repository for `mini.nvim`, which is a suite of small, independent plugins/modules.
	"echasnovski/mini.nvim",

	-- Custom configuration function for `mini.nvim` modules.
	config = function()
		-- Setup for `mini.ai`, which enhances text objects for more intuitive editing.
		-- This module allows you to perform actions within or around text objects more easily.
		-- The `n_lines` option sets the search range to 500 lines for finding the text objects.
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Setup for `mini.surround`, which provides functionality to easily add, delete, or replace
		-- surrounding characters like brackets, quotes, etc., around text objects.
		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
		-- The configuration demonstrates just a few of the available `mini.nvim` modules.
		-- For more modules and detailed documentation, visit the `mini.nvim` GitHub page:
		-- https://github.com/echasnovski/mini.nvim
	end,
}
