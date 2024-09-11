function env_context()
  local env_file_path = vim.fn.getcwd() .. "/.envrc.context"
  local env_file = io.open(env_file_path, "r")
  if env_file then
    local content = env_file:read("*all")
    env_file:close()
    content = content:gsub("%z", "")  -- Clean up null characters if present
    return "env: " .. content  -- Formatting the output as "env: content"
  else
    return "env: No env"  -- Formatting when no environment file is found
  end
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "catppuccin",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { "buffers" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { { env_context, color = { fg = "#ebdbb2", gui = "bold" } } },
                lualine_z = { "progress", "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {
                "nvim-tree",
                "oil",
                "fugitive",
            },
        })
    end,
}
