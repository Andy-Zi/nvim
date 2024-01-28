return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"tpope/vim-fugitive",
		"folke/neodev.nvim",
		"theHamsta/nvim-dap-virtual-text",
		-- Python
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

		vim.keymap.set("n", "<Leader>dt", ":lua require('dapui').toggle()<CR>")
		vim.keymap.set("n", "<Leader>dr", ":lua require('dapui').open({reset = true})<CR>")
		vim.keymap.set("n", "<F5>", ":DapContinue<CR>")
		vim.keymap.set("n", "<F6>", ":DapTerminate<CR>")
		vim.keymap.set("n", "<F9>", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<F10>", ":DapStepOver<CR>")
		vim.keymap.set("n", "<F11>", ":DapStepInto<CR>")
		vim.keymap.set("n", "<F12>", ":DapStepOut<CR>")
		vim.keymap.set("n", "<Leader>dl", ":lua require('dap.ext.vscode').load_launchjs()<CR>")

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
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{
				text = "🚫",
				texthl = "DapBreakpointRejected",
				linehl = "DapBreakpointRejected",
				numhl = "DapBreakpointRejected",
			}
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{
				text = "🔍",
				texthl = "DapBreakpointCondition",
				linehl = "DapBreakpointCondition",
				numhl = "DapBreakpointCondition",
			}
		)
		vim.fn.sign_define(
			"DapBreakpointHit",
			{ text = "🎯", texthl = "DapBreakpointHit", linehl = "DapBreakpointHit", numhl = "DapBreakpointHit" }
		)

		require("dap-python").setup("~/.virtualenvs/debugpy3.11/bin/python")
	end,
}
