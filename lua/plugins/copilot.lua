return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("n", "<leader>P", "<cmd>Copilot<CR>", { noremap = true, silent = true, desc = "Open Co[P]ilot" })
  end,
}
