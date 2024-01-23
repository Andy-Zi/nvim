return {
     "mbbill/undotree",
     config = function()
          vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
          vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
          vim.opt.undofile = true
          local wk = require("which-key")
          wk.register({
               ["<leader>-u"] = { vim.cmd.UndoTreeToggle, "Undo Tree" },
          })
     end,
}
