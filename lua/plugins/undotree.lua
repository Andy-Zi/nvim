return {
     "mbbill/undotree",
     config = function()
          vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
          vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
          vim.opt.undofile = true
          vim.opt.undolevels = 10000
          vim.g.undotree_WindowLayout = 2

          local wk = require("which-key")
          wk.register({
               ["<leader>u"] = { vim.cmd.UndoTreeToggle, "Undo Tree" },
          })
     end,
}
