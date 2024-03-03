-- Highlight text when it is yanked (copied), enhancing visual feedback.
-- The `TextYankPost` event triggers after text has been yanked.
-- A new autocommand group `kickstart-highlight-yank` is created to ensure
-- that the autocommand doesn't duplicate on subsequent sourcing of the config.
-- The `clear = true` option clears any existing autocommands in the group,
-- preventing duplication.
-- The callback function uses `vim.highlight.on_yank()` to highlight the yanked text.
-- The `desc` field provides a description for the autocommand, improving readability and maintainability.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- Create an autocommand that triggers on the BufWinEnter event.
-- This event occurs after entering a buffer window, making it suitable for
-- operations that should apply as soon as a file is displayed in a window.
vim.api.nvim_create_autocmd('BufWinEnter', {
  -- Provide a description for this autocommand for clarity and maintainability.
  desc = 'Automatically open all folds when opening a file',

  -- Assign the autocommand to a specific group named 'AutoOpenFolds'.
  -- The 'clear = true' option ensures that any previous commands in this group
  -- are cleared out, preventing duplication of the autocommand in the same group.
  group = vim.api.nvim_create_augroup('AutoOpenFolds', { clear = true }),

  -- The callback function contains the actual command to be executed when
  -- the autocommand is triggered. In this case, it opens all folds in the file.
  callback = function()
    -- Execute 'zR' in normal mode to open all folds.
    -- The 'normal!' command ensures that 'zR' is executed in normal mode,
    -- and 'zR' is the Vim command to open all folds.
    vim.cmd('normal! zR')
  end,
})

