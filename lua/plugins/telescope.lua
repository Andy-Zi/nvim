return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            vim.keymap.set("n", "<leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)
            vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
            vim.keymap.set("n", "<leader>pb", function()
                builtin.buffers({
                    sort_lastused = true,
                    ignore_current_buffer = true,
                    show_all_buffers = true,
                })
            end)
            vim.api.nvim_set_keymap("n", "<Leader><tab>", "<Cmd>lua require('telescope.builtin').commands()<CR>", {noremap=false})
            local wk = require("which-key")
            wk.register({
                ["<leader>pf"] = { builtin.find_files, "Find files" },
                ["<C-p>"] = { builtin.git_files, "Git files" },
                ["<leader>ps"] = {
                    function()
                        builtin.grep_string({ search = vim.fn.input("Grep > ") })
                    end,
                    "Grep string",
                },
                ["<leader>vh"] = { builtin.help_tags, "Help tags" },
                ["<leader>pb"] = {
                    function()
                        builtin.buffers({
                            sort_lastused = true,
                            ignore_current_buffer = true,
                            show_all_buffers = true,
                        })
                    end,
                    "Buffers",
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
