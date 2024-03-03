return {
    -- The plugin repository for `cellular-automaton.nvim`. This plugin adds cellular
    -- automaton simulations to Neovim, allowing for unique visualizations within the editor.
    "Eandrju/cellular-automaton.nvim",

    -- The configuration function for the plugin. This is where you set up any initial
    -- settings or keybindings related to the plugin's functionality.
    config = function()
        -- Sets a keybinding in normal mode for "<leader>mr" that starts the "make it rain"
        -- simulation. This command triggers a visual effect that resembles rain falling
        -- in your Neovim window.
        vim.keymap.set("n", "<leader><leader>ar", "<cmd>CellularAutomaton make_it_rain<CR>");

        -- Sets a keybinding in normal mode for "<leader>ml" that starts the "game of life"
        -- simulation. This command triggers Conway's Game of Life, a cellular automaton
        -- simulation known for its complex and interesting patterns that evolve over time.
        vim.keymap.set("n", "<leader><leader>al", "<cmd>CellularAutomaton game_of_life<CR>");
    end,
}
