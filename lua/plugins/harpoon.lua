return {
	"ThePrimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, {desc="Harpoon mark", silent=true, noremap=true})
		vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, {desc="Harpoon list", silent=true, noremap=true})

		vim.keymap.set("n", "<leader>1", function()
		ui.nav_file(1)
		end, {desc="Harpoon 1", silent=true, noremap=true})
		vim.keymap.set("n", "<leader>2", function()
		ui.nav_file(2)
		end, {desc="Harpoon 2", silent=true, noremap=true})
		vim.keymap.set("n", "<leader>3", function()
		ui.nav_file(3)
		end, {desc="Harpoon 3", silent=true, noremap=true})
		vim.keymap.set("n", "<leader>4", function()
		ui.nav_file(4)
		end, {desc="Harpoon 4", silent=true, noremap=true})
	end,
}
