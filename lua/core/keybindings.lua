-- Set <space> as the leader key, which is used as a prefix for triggering custom shortcuts
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear search highlighting when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move selected lines down with 'J' and up with 'K' in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Join lines without moving the cursor in normal mode
vim.keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true })

-- Center the screen after scrolling with Ctrl+d and Ctrl+u
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Keep the cursor centered vertically on the screen when navigating search results
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })

-- Replace the selection with the default register without overriding it in visual mode
vim.keymap.set("x", "<leader>p", [["_dP]], { noremap = true, silent = true })

-- Copy to clipboard with double leader press then 'y' in normal and visual mode, 'Y' for copying the whole line
vim.keymap.set({ "n", "v" }, "<leader><leader>y", [["+y]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader><leader>Y", [["+Y]], { noremap = true, silent = true })

-- Paste from clipboard with double leader press then 'p' in normal and visual mode, 'P' for pasting above the cursor
vim.keymap.set({ "n", "v" }, "<leader><leader>p", [["+p]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader><leader>P", [["+P]], { noremap = true, silent = true })

-- Delete without affecting the clipboard using double leader press then 'd'
vim.keymap.set({ "n", "v" }, "<leader><leader>d", [["_d]], { noremap = true, silent = true })

-- Disable the 'Q' command in normal mode to prevent entering Ex mode
vim.keymap.set("n", "Q", "<nop>", { noremap = true, silent = true })

-- Format code using the built-in LSP with <leader>f
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true })

-- Navigate through quickfix list items with Ctrl+k and Ctrl+j, centering the view on each item
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { noremap = true, silent = true})
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { noremap = true, silent = true})
-- Navigate diagnostics with <leader>k and <leader>j
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { noremap = true, silent = true })

-- Replace word under cursor across the whole file with <leader>r
vim.keymap.set(
	"n",
	"<leader>r",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{desc="change all", noremap = true, silent = true }
)

-- Navigate vim panes with Ctrl+{h,j,k,l}
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { noremap = true, silent = true })

-- Navigate buffers with 'H' and 'L'
vim.keymap.set("n", "H", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "L", ":bnext<CR>", { noremap = true, silent = true })

-- Delete current buffer without closing the window with <Leader>bd
vim.api.nvim_set_keymap("n", "<Leader>bd", ":bp<CR>:bd #<CR>", {desc="Delete buffer", noremap = true, silent = true })

-- Resize splits using Ctrl+arrow keys
vim.keymap.set("n", "<c-up>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-down>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-left>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-right>", ":vertical resize -2<CR>", { noremap = true, silent = true })

-- Navigate between tabs with Ctrl+Alt+{h,l}, create a new tab with Ctrl+Alt+c, and close the current tab with Ctrl+Alt+x
vim.keymap.set("n", "<C-M-h>", ":tabprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-l>", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-c>", ":tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-x>", ":tabclose<CR>", { noremap = true, silent = true })

-- Toggle text wrapping and line breaking with <leader>w and <leader><leader>w
vim.keymap.set("n", "<leader>w", ":set wrap linebreak<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><leader>w", ":set nowrap nolinebreak<CR>", { noremap = true, silent = true })
