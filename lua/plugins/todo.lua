-- Highlight TODO, FIXME, NOTE, and other annotations within comments in Neovim.
-- This plugin makes these annotations stand out visually, helping you to keep track
-- of important comments and tasks directly within your code.
return {
	-- The main plugin repository for todo-comments.
	"folke/todo-comments.nvim",

	-- Load the plugin when Neovim starts. This ensures that the functionality
	-- provided by todo-comments is available as soon as you open Neovim,
	-- without any manual activation required.
	event = "VimEnter",

	-- The plugin depends on 'plenary.nvim', a Lua library that provides
	-- utility functions and async capabilities. This dependency must be
	-- satisfied for todo-comments to work properly.
	dependencies = { "nvim-lua/plenary.nvim" },

	-- Configuration options for the plugin. Here, `opts` specifies that
	-- signs (icons or indicators in the sign column next to the line numbers)
	-- should be disabled. This could be because you prefer a cleaner gutter
	-- or you're using the sign column for other purposes.
	-- You can customize todo-comments further by adjusting `opts` with
	-- more configuration options as documented by the plugin.
	opts = { signs = false },
}
