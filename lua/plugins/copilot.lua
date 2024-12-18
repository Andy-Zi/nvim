return {
  {
    "github/copilot.vim",
    config = function()
      vim.keymap.set(
        "n",
        "<leader>P",
        "<cmd>Copilot<CR>",
        { noremap = true, silent = true, desc = "Open Co[P]ilot" }
      )
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },                    -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                       -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    keys = {
      {
        "<leader>ccq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      {
        "<leader>ccp",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    config = function()
      -- Registers copilot-chat filetype for markdown rendering
      require("render-markdown").setup({
        file_types = { "copilot-chat" },
      })

      -- You might also want to disable default header highlighting for copilot chat when doing this and set error header style and separator
      require("CopilotChat").setup({
        highlight_headers = false,
        separator = "---",
        error_header = "> [!ERROR] Error",
        -- rest of your config
      })
    end,
  },
}
