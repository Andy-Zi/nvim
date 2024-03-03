return {
  -- "numToStr/Comment.nvim" is a Neovim plugin for easily commenting out lines and blocks
  -- of code. It supports toggling, commenting, and uncommenting lines efficiently with
  -- support for numerous programming languages.
  "numToStr/Comment.nvim",

  -- The `opts` table can be used to configure "Comment.nvim" with specific settings.
  -- Since it's empty here, default settings will be used. You can customize comment
  -- behavior, mappings, and more by filling in this table.
  opts = {
  },

  -- The `lazy` key determines when the plugin should be loaded. Setting it to `false`
  -- means the plugin will be loaded immediately on Neovim startup, rather than being
  -- loaded on demand based on specific triggers or commands. This is useful for plugins
  -- that you want to be always available or that provide functionality needed from the
  -- very beginning of the editing session.
  lazy = false,
}
