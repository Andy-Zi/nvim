return {
    "tiagovla/scope.nvim",
    config = function()
        require("scope").setup({
            -- whether to preview the scope of a command when you type it in the
            -- commandline
            preview = true,
            -- whether to preview the scope of a command when you show the
            -- documentation
            show_help = true,
        })
        require("telescope").load_extension("scope")
    end,

}
