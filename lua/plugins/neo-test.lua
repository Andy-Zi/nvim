return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
		"folke/lazydev.nvim",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					-- Extra arguments for nvim-dap configuration
					-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
					dap = { justMyCode = false },
					-- Command line arguments for runner
					-- Can also be a function to return dynamic values
					args = { "--log-level", "DEBUG" },
					-- Runner to use. Will use pytest if available by default.
					-- Can be a function to return dynamic value.
					runner = "pytest",
					-- Custom python path for the runner.
					-- Can be a string or a list of strings.
					-- Can also be a function to return dynamic value.
					-- If not provided, the path will be inferred by checking for
					-- virtual envs in the local directory and for Pipenev/Poetry configs
					python = ".venv/bin/python",
					-- Returns if a given file path is a test file.
					-- NB: This function is called a lot so don't perform any heavy tasks within it.
					-- is_test_file = function(file_path) end,
					-- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
					-- instances for files containing a parametrize mark (default: false)
					pytest_discover_instances = true,
				}),
			},
		})

        vim.diagnostic.config({ virtual_text = true })
		vim.keymap.set(
			"n",
			"<leader>tr",
			'<cmd>lua require("neotest").run.run()<cr>',
			{ desc = "Run nearest test", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>tf",
			'<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>',
			{ desc = "Run current file", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>td",
			'<cmd>lua require("neotest").run.run({strategy = "dap"})<cr>',
			{ desc = "Debug nearest test", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>tx",
			'<cmd>lua require("neotest").run.stop()<cr>',
			{ desc = "Stop nearest test", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>ta",
			'<cmd>lua require("neotest").run.attach()<cr>',
			{ desc = "Attach nearest test", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>to",
			'<cmd>lua require("neotest").output.open({ enter = true })<cr>',
			{ desc = "open testui", noremap = true, silent = true }
		)
        vim.keymap.set(
            "n",
            "<leader>tt",
            '<cmd>lua require("neotest").output_panel.toggle()<cr>',
            { desc = "Toggle panel", noremap = true, silent = true }
        )
        vim.keymap.set(
            "n",
            "<leader>ts",
            '<cmd>lua require("neotest").summary.toggle() <cr>',
            { desc = "Toggle summary", noremap = true, silent = true }
        )
        local wk = require("which-key")
        wk.register({
            ['<leader>t'] = 'Test'
        })
	end,
}
