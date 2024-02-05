return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {desc="Find files", noremap=false, silent=true})
            vim.keymap.set("n", "<C-p>", builtin.git_files, {desc="Git files", noremap=false, silent=true})
            vim.keymap.set("n", "<leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end,{desc="Grep string", noremap=false, silent=true})
            vim.keymap.set("n", "<leader>vh", builtin.help_tags, {desc="Help tags", noremap=false, silent=true})
            vim.keymap.set("n", "<leader>pb", function()
                builtin.buffers({
                    sort_lastused = true,
                    ignore_current_buffer = true,
                    show_all_buffers = true,
                })
            end, {desc="Buffers", noremap=false, silent=true})
            vim.keymap.set("n", "<Leader><tab>", "<Cmd>lua require('telescope.builtin').commands()<CR>", {desc="commands", noremap=false, silent=true})
            vim.keymap.set("n", "<leader>pt", "<Cmd>Telescope<CR>", {desc="Telescope", noremap=false, silent=true})
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
