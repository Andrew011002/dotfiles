return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
            vim.keymap.set("n", "<leader>M", ":Mason <CR>", {})
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "dockerls",
                    "golangci_lint_ls",
                    "lua_ls",
                    "pyright",
                    "rust_analyzer",
                    "tsserver",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            lspconfig.dockerls.setup({
                capabilities = capabilities,
            })
            lspconfig.golangci_lint_ls.setup({})
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            autoImportCompletions = false,
                            diagnosticMode = "openFilesOnly",
                            diagnosticSeverityOverrides = {
                                --         reportGeneralTypeIssues = "false",
                                reportIncompatibleMethodOverride = "false",
                                reportImplicitOverride = "false",
                                reportUnknownArgumentType = "false",
                                reportUnknownMemberType = "false",
                                reportArgumentType = "false",
                                reportInvalidTypeArguments = "false",
                            },
                        },
                    },
                },
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
