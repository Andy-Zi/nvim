-- Set <space> as the leader key, which is used as a prefix for triggering custom shortcuts
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear search highlighting when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', {desc = "Clear search highlight"})

-- Move selected lines down with 'J' and up with 'K' in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move line down in visual mode" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move line up in visual mode" })

-- Join lines without moving the cursor in normal mode
vim.keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true, desc = "Join lines without moving cursor" })

-- Center the screen after scrolling with Ctrl+d and Ctrl+u
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Center screen after scrolling down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Center screen after scrolling up" })

-- Keep the cursor centered vertically on the screen when navigating search results
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true, desc = "Center cursor when navigating to next search result" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "Center cursor when navigating to previous search result" })

-- Replace the selection with the default register without overriding it in visual mode
vim.keymap.set("x", "<leader>p", [["_dP]], { noremap = true, silent = true, desc = "Paste over selection without yanking" })

-- Copy to clipboard with double leader press then 'y' in normal and visual mode, 'Y' for copying the whole line
vim.keymap.set({ "n", "v" }, "<leader><leader>y", [["+y]], { noremap = true, silent = true, desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader><leader>Y", [["+Y]], { noremap = true, silent = true, desc = "Copy whole line to clipboard" })

-- Paste from clipboard with double leader press then 'p' in normal and visual mode, 'P' for pasting above the cursor
vim.keymap.set({ "n", "v" }, "<leader><leader>p", [["+p]], { noremap = true, silent = true, desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader><leader>P", [["+P]], { noremap = true, silent = true, desc = "Paste above from clipboard" })

-- Delete without affecting the clipboard using double leader press then 'd'
vim.keymap.set({ "n", "v" }, "<leader><leader>d", [["_d]], { noremap = true, silent = true, desc = "Delete without yanking" })

-- Disable the 'Q' command in normal mode to prevent entering Ex mode
vim.keymap.set("n", "Q", "<nop>", { noremap = true, silent = true, desc = "Disable Ex mode entry with Q" })

-- Format code using the built-in LSP with <leader>f
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format code with LSP" })

-- Navigate through quickfix list items with Ctrl+k and Ctrl+j, centering the view on each item
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { noremap = true, silent = true, desc = "Next item in quickfix list" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { noremap = true, silent = true, desc = "Previous item in quickfix list" })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message', noremap = true, silent = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message', noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages', noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list', noremap = true, silent = true })

-- Replace word under cursor across the whole file with <leader>r
vim.keymap.set(
    "n",
    "<leader>r",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    {desc="Replace word under cursor across file", noremap = true, silent = true }
)

-- Navigate vim panes with Ctrl+{h,j,k,l}
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { noremap = true, silent = true, desc = "Move to pane above" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { noremap = true, silent = true, desc = "Move to pane below" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { noremap = true, silent = true, desc = "Move to left pane" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { noremap = true, silent = true, desc = "Move to right pane" })

-- Navigate buffers with 'H' and 'L'
vim.keymap.set("n", "H", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "L", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })

-- Delete current buffer without closing the window with <Leader>bd
vim.api.nvim_set_keymap("n", "<Leader>bd", ":bp<CR>:bd #<CR>", {desc="Delete current buffer", noremap = true, silent = true })

-- Resize splits using Ctrl+arrow keys
vim.keymap.set("n", "<c-up>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Increase split height" })
vim.keymap.set("n", "<c-down>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Decrease split height" })
vim.keymap.set("n", "<c-left>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc = "Increase split width" })
vim.keymap.set("n", "<c-right>", ":vertical resize -2<CR>", { noremap = true, silent = true, desc = "Decrease split width" })

-- Navigate between tabs with Ctrl+Alt+{h,l}, create a new tab with Ctrl+Alt+c, and close the current tab with Ctrl+Alt+x
vim.keymap.set("n", "<C-M-h>", ":tabprev<CR>", { noremap = true, silent = true, desc = "Previous tab" })
vim.keymap.set("n", "<C-M-l>", ":tabnext<CR>", { noremap = true, silent = true, desc = "Next tab" })
vim.keymap.set("n", "<C-M-c>", ":tabnew<CR>", { noremap = true, silent = true, desc = "New tab" })
vim.keymap.set("n", "<C-M-x>", ":tabclose<CR>", { noremap = true, silent = true, desc = "Close current tab" })

-- Toggle text wrapping and line breaking
vim.keymap.set("n", "<leader><leader>w", function()
    vim.wo.wrap = not vim.wo.wrap
    if vim.wo.wrap then
        vim.wo.linebreak = true
    else
        vim.wo.linebreak = false
    end
end, { noremap = true, silent = true, desc = "Toggle line wrapping" })

-- Easier exit from terminal mode using <Esc><Esc> instead of the default <C-\><C-n>.
vim.keymap.set('t', '<C-n>', '<C-\\><C-n>', { desc = 'Exit terminal mode', noremap = true, silent = true })
