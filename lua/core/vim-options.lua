-- Turn on absolute line numbers
vim.opt.number = true

-- Turn on relative line numbers for easier navigation
vim.opt.relativenumber = true

-- Enable mouse support in all modes ('a' stands for all)
vim.opt.mouse = 'a'

-- Enable smart indentation for automatically adjusting indentation level based on the code structure
vim.opt.smartindent = true

-- Enable break indent, making wrapped lines visually indented to match their starting line
vim.opt.breakindent = true

-- Search ignoring case unless a capital letter is used or the pattern contains '\C'
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Always show the sign column, avoiding text shifting when signs (e.g., linters, git markers) are added or removed
vim.opt.signcolumn = 'yes'

-- Set the update time to 250ms, affecting how often Neovim refreshes and triggers certain events like the CursorHold event
vim.opt.updatetime = 50

-- Set the timeout length to 300ms, affecting how long Neovim waits for a mapped sequence to complete
vim.opt.timeoutlen = 100

-- Open new splits to the right and below the current window, respectively
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Display whitespace characters using specific symbols (e.g., tabs as '» ', trailing spaces as '·', and non-breaking spaces as '␣')
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show the effects of substitutions live as you type them, in a split window
vim.opt.inccommand = 'split'

-- Highlight the line where the cursor is located
vim.opt.cursorline = true

-- Keep at least 10 lines of context around the cursor when scrolling
vim.opt.scrolloff = 10

-- Highlight search matches, but allow clearing the highlighting by pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- Set the number of spaces a tab counts for to 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Set the number of spaces to use for each step of (auto)indent to 4
vim.opt.shiftwidth = 4

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Disable text wrapping
vim.opt.wrap = false

-- Disable creation of swap files
vim.opt.swapfile = false

-- Disable making backup before overwriting a file
vim.opt.backup = false

-- Enable incremental search, showing matches as you type
vim.opt.incsearch = true

-- Enable true color support
vim.opt.termguicolors = true

-- Set conceal level to 1, allowing certain syntax elements (like markdown links) to be hidden or displayed differently
vim.opt.conceallevel = 1
