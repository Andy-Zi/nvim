return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"tpope/vim-fugitive",
		"folke/neodev.nvim",
		"theHamsta/nvim-dap-virtual-text",
		"jay-babu/mason-nvim-dap.nvim",
		--python
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		require("nvim-dap-virtual-text").setup()
		require("dapui").setup()
		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})
		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set(
			"n",
			"<Leader>dt",
			":lua require('dapui').toggle()<CR>",
			{ desc = "Toggle DAP UI", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<Leader>dr",
			":lua require('dapui').open({reset = true})<CR>",
			{ desc = "Reset DAP UI", noremap = true, silent = true }
		)
		vim.keymap.set("n", "<leader>du", ":DapContinue<CR>", { desc = "DAP Continue", noremap = true, silent = true })
		vim.keymap.set(
			"n",
			"<leader>dx",
			":DapTerminate<CR>",
			{ desc = "DAP Terminate", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>dd",
			":DapToggleBreakpoint<CR>",
			{ desc = "DAP Toggle Breakpoint", noremap = true, silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>do",
			":require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))",
			{ desc = "DAP Toggle Logpoint", noremap = true, silent = true }
		)
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end, { desc = "DAP Hover", noremap = true, silent = true })
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end, { desc = "DAP Preview", noremap = true, silent = true })
		vim.keymap.set("n", "<Leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end, { desc = "DAP Frames", noremap = true, silent = true })
		vim.keymap.set("n", "<Leader>ds", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end, { desc = "DAP Scopes", noremap = true, silent = true })
		vim.keymap.set("n", "<F5>", ":DapStepOver<CR>", { desc = "DAP Step Over", noremap = true, silent = true })
		vim.keymap.set("n", "<F6>", ":DapStepInto<CR>", { desc = "DAP Step Into", noremap = true, silent = true })
		vim.keymap.set("n", "<F7>", ":DapStepOut<CR>", { desc = "DAP Step Out", noremap = true, silent = true })
		vim.keymap.set({ "n", "v" }, "<leader>de" ,"<Cmd>lua require('dapui').eval()<CR>", { desc = "DAP Eval", noremap = true, silent = true })

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "🛑", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		vim.fn.sign_define(
			"DapStopped",
			{ text = "🟢", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
		)
		vim.fn.sign_define(
			"DapLogPoint",
			{ text = "📝", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
		)
		vim.fn.sign_define("DapBreakpointRejected", {
			text = "🚫",
			texthl = "DapBreakpointRejected",
			linehl = "DapBreakpointRejected",
			numhl = "DapBreakpointRejected",
		})
		vim.fn.sign_define("DapBreakpointCondition", {
			text = "🔍",
			texthl = "DapBreakpointCondition",
			linehl = "DapBreakpointCondition",
			numhl = "DapBreakpointCondition",
		})
		vim.fn.sign_define(
			"DapBreakpointHit",
			{ text = "🎯", texthl = "DapBreakpointHit", linehl = "DapBreakpointHit", numhl = "DapBreakpointHit" }
		)

		--python
		-- require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
		require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
	end,
}
