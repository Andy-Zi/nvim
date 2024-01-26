return {
	"ThePrimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file)
		vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

		vim.keymap.set("n", "<leader>1", function()
		ui.nav_file(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
		ui.nav_file(2)
		end)
		vim.keymap.set("n", "<leader>3", function()
		ui.nav_file(3)
		end)
		vim.keymap.set("n", "<leader>4", function()
		ui.nav_file(4)
		end)
          local wk = require("which-key")
          wk.register({
               ["C-e"] = {ui.toggle_quick_menu, "Harpoon menu"},
               ["<leader>a"] = {mark.add_file, "Harpoon mark"},
               ["<leader>1"] = {function() ui.nav_file(1) end, "Harpoon 1"},
               ["<leader>2"] = {function() ui.nav_file(2) end, "Harpoon 2"},
               ["<leader>3"] = {function() ui.nav_file(3) end, "Harpoon 3"},
               ["<leader>4"] = {function() ui.nav_file(4) end, "Harpoon 4"},
          })
	end,
}
