return {
     -- Managing LSP's
     {
          "williamboman/mason.nvim",
          config = function()
               require("mason").setup()
          end,
     },
     -- autoinstall LSP's
     {
          "williamboman/mason-lspconfig.nvim",
          config = function()
               require("mason-lspconfig").setup({
                    ensure_installed = {
                         "lua_ls",
                         "tsserver",
                         "pyright",
                         --"rust_analyzer"
                    },
               })
          end,
     },
     -- setup LSP's for use in nvim
     {
          "neovim/nvim-lspconfig",
          config = function()
               local capabilities = require("cmp_nvim_lsp").default_capabilities()

               local lspconfig = require("lspconfig")
               lspconfig.pyright.setup({
                    capabilities = capabilities,
               })
               lspconfig.tsserver.setup({
                    capabilities = capabilities,
               })
               --lspconfig.rust_analyzer.setup({})
               lspconfig.lua_ls.setup({
                    capabilities = capabilities,
               })
               --
               -- Global mappings.
               -- See `:help vim.diagnostic.*` for documentation on any of the below functions
               vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {desc="LSP open float", noremap = true, silent = true})
               vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {desc="LSP goto prev", noremap = true, silent = true})
               vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {desc="LSP goto next", noremap = true, silent = true})
               vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {desc="LSP set loclist", noremap = true, silent = true})

               vim.api.nvim_create_autocmd("LspAttach", {
                    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                    callback = function(ev)
                         -- Enable completion triggered by <c-x><c-o>
                         vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                         -- Buffer local mappings.
                         -- See `:help vim.lsp.*` for documentation on any of the below functions
                         vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, silent = true, noremap = true, desc="LSP declaration"})
                         vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, silent = true, noremap = true, desc="LSP definition"})
                         vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, silent = true, noremap = true, desc="LSP hover"})
                         vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, silent = true, noremap = true, desc="LSP implementation"})
                         vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, silent = true, noremap = true, desc="LSP signature help"})
                         vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, silent = true, noremap = true, desc="LSP add workspace folder"})
                         vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, silent = true, noremap = true, desc="LSP remove workspace folder"})
                         vim.keymap.set("n", "<leader>wl", function()
                              print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                         end, { buffer = ev.buf, silent = true, noremap = true, desc="LSP list workspace folders"})
                         vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = ev.buf, silent = true, noremap = true, desc="LSP type definition"})
                         vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, silent = true, noremap = true, desc="LSP rename"})
                         vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, silent = true, noremap = true, desc="LSP code action"})
                         vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, silent = true, noremap = true, desc="LSP references"})
                         vim.keymap.set("n", "<leader>f", function()
                              vim.lsp.buf.format({ async = true })
                         end, { buffer = ev.buf, silent = true, noremap = true, desc="LSP format"})
                    end,
               })
          end,
     },
}
