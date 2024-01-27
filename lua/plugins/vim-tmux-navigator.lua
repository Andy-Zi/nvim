return {
     "christoomey/vim-tmux-navigator",
     cmd = {
          "TmuxNavigateLeft",
          "TmuxNavigateDown",
          "TmuxNavigateUp",
          "TmuxNavigateRight",
          "TmuxNavigatePrevious",
     },
     keys = {
          { "<c-h>",  "<cmd>TmuxNavigateLeft<cr>" },
          { "<c-j>",  "<cmd>TmuxNavigateDown<cr>" },
          { "<c-k>",  "<cmd>TmuxNavigateUp<cr>" },
          { "<c-l>",  "<cmd>TmuxNavigateRight<cr>" },
     },
     config = function()
          local wk = require("which-key")
          wk.register({
               ["<c-h>"] = { "<cmd>TmuxNavigateLeft<cr>", "TmuxNavigateLeft" },
               ["<c-j>"] = { "<cmd>TmuxNavigateDown<cr>", "TmuxNavigateDown" },
               ["<c-k>"] = { "<cmd>TmuxNavigateUp<cr>", "TmuxNavigateUp" },
               ["<c-l>"] = { "<cmd>TmuxNavigateRight<cr>", "TmuxNavigateRight" },
          }, {})
     end,
}
