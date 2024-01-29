return{
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup{
            size = 20,
            open_mapping = [[<c-\>]],
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 1,
            start_in_insert = true,
            persist_size = true,
            direction = 'float',
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = 'curved',
                winblend = 3,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                }
            }
        }
        vim.api.nvim_set_keymap('n', '<leader>gl', ':lua require("toggleterm").exec("lazygit")<CR>', {noremap = true, silent = true})
    end
}
