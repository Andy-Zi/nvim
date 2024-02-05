vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { noremap = true, silent = true })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader><leader>y", [["+y]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader><leader>Y", [["+Y]], { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader><leader>p", [["+p]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader><leader>P", [["+P]], { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader><leader>d", [["_d]], { noremap = true, silent = true })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "Q", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true })

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { noremap = true, silent = true})
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { noremap = true, silent = true})
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { noremap = true, silent = true })

vim.keymap.set(
	"n",
	"<leader>r",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ noremap = true, silent = true }
)
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { noremap = true, silent = true})

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader><leader>s", ":nohlsearch<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "H", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "L", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>bd", ":bn<CR>:bd #<CR>", {desc="Delete buffer", noremap = true, silent = true })

vim.keymap.set("n", "<c-up>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-down>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-left>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-right>", ":vertical resize -2<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-M-h>", ":tabprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-l>", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-c>", ":tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-x>", ":tabclose<CR>", { noremap = true, silent = true })
