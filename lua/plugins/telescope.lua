return {
	-- The main Telescope plugin repository.
	"nvim-telescope/telescope.nvim",

	-- Load Telescope on VimEnter event to delay loading at startup.
	event = "VimEnter",

	-- Specify a particular branch of Telescope to use.
	branch = "0.1.x",

	-- List of plugins Telescope depends on or integrates with.
	dependencies = {
		-- Plenary.nvim is a Lua utility library required by many Neovim plugins including Telescope.
		"nvim-lua/plenary.nvim",

		{ -- Telescope extension for FZF-native, providing C-optimized fuzzy finding.
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make", -- Run `make` to build the extension.
			cond = function()
				return vim.fn.executable("make") == 1
			end, -- Load only if `make` is available.
		},

		-- UI enhancements for Telescope selections.
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Optional dependency for file icons.
		{ "nvim-tree/nvim-web-devicons" },
	},

	-- Configuration function for setting up Telescope.
	config = function()
		-- Setup call with options and extensions.
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(), -- Use dropdown theme for ui-select.
				},
			},
		})

		-- Enable Telescope extensions 'fzf' and 'ui-select' if they are installed. These extensions enhance
		-- the searching capabilities of Telescope with FZF's fuzzy finding algorithm and a better UI selection interface.
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- Import Telescope's built-in functions for easy access to its features.
		local builtin = require("telescope.builtin")

		-- Define keybindings for accessing common Telescope functions, each with a descriptive tooltip.
		-- These bindings allow quick access to searching help tags, keymaps, files, and more.
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch existing [B]uffers" })
		vim.keymap.set(
			"n",
			"<Leader>sc",
			"<Cmd>lua require('telescope.builtin').commands()<CR>",
			{ desc = "[S]earch [C]ommands" }
		)
		vim.keymap.set("n", "<leader>sT", "<Cmd>Telescope<CR>", { desc = "[S]earch [T]elescope" })

		-- Advanced searching with custom configurations to modify behavior and appearance of the search results.
		-- These examples showcase how to override default Telescope settings for specific searches.
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10, -- Control transparency of dropdown
				previewer = false, -- Disable preview pane
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true, -- Limit search to open files
				prompt_title = "Live Grep in Open Files", -- Custom title for the search prompt
			})
		end, { desc = "[S]earch [/] in Open Files" })

		-- Define shortcuts for quickly finding Neovim config files or grepping for a string
		-- across your workspace, demonstrating the flexibility of Telescope for custom workflows.
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		vim.keymap.set("n", "<leader>st", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "[S]earch live grep with [T]ext" })
	end,
}
