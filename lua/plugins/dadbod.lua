return {
	-- The main plugin for interacting with databases directly from Vim/Neovim.
	"tpope/vim-dadbod",

	-- This plugin is eagerly loaded (`lazy = false`), meaning it's available as soon as Vim/Neovim starts.
	-- However, `opt = true` contradicts this by marking it as optional, so it seems there's a confusion in intent.
	lazy = false,
	opt = true,

	-- Dependencies include additional functionality for vim-dadbod.
	dependencies = {
		{
			-- "vim-dadbod-ui" provides a user-friendly interface for managing database connections
			-- and executing queries within Vim/Neovim.
			"kristijanhusak/vim-dadbod-ui",

			-- This plugin itself depends on "vim-dadbod" for core functionality and
			-- "vim-dadbod-completion" for autocompletion in SQL files.
			dependencies = {
				{ "tpope/vim-dadbod",                     lazy = true },
				{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
			},

			-- Commands to lazily load "vim-dadbod-ui" when any of these commands are executed.
			cmd = {
				"DBUI",
				"DBUIToggle",
				"DBUIAddConnection",
				"DBUIFindBuffer",
			},

			-- Initial configuration setup for "vim-dadbod-ui", such as enabling nerd fonts.
			init = function()
				vim.g.db_ui_use_nerd_fonts = 1
			end,
		},
		{
			-- "vim-dadbod-completion" provides autocompletion for SQL queries based on
			-- your database schema. It's configured to only activate for specific filetypes.
			"kristijanhusak/vim-dadbod-completion",

			-- Setup nvim-cmp source for SQL autocompletion when editing SQL-related filetypes.
			config = function()
				vim.api.nvim_create_autocmd("FileType", {
					pattern = { "sql", "mysql", "plsql" },
					callback = function()
						-- Setup buffer-specific completion sources.
						require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
					end,
				})
			end,
		},
	},

	-- Global configuration for vim-dadbod, such as keybindings and database connection storage location.
	config = function()
		-- Keybinding for toggling the DBUI window.
		vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>", { desc = "Toggle DBUI", noremap = true, silent = true })

		-- Specify the location where database connections configured through vim-dadbod-ui are saved.
		-- Uses the standard configuration path for Neovim and appends ".db_ui" for storing connections.
		vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. ".db_ui"
	end,
}
