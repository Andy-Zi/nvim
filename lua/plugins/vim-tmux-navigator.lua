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
          { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
          { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
          { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
          { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
          { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
     },
     config = function() 
          local wk = require("which-key")
          wk.register({
               ["<c-h>"] = { "<cmd><C-U>TmuxNavigateLeft<cr>", "TmuxNavigateLeft" },
               ["<c-j>"] = { "<cmd><C-U>TmuxNavigateDown<cr>", "TmuxNavigateDown" },
               ["<c-k>"] = { "<cmd><C-U>TmuxNavigateUp<cr>", "TmuxNavigateUp" },
               ["<c-l>"] = { "<cmd><C-U>TmuxNavigateRight<cr>", "TmuxNavigateRight" },
               ["<c-\\>"] = { "<cmd><C-U>TmuxNavigatePrevious<cr>", "TmuxNavigatePrevious" },
          }, {})
     end,
}
