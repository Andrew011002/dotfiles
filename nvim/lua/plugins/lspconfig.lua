return {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
		config = function()
			require("mason").setup({})
			vim.keymap.set("n", "<leader>M", ":Mason <CR>", {})

            require("mason-tool-installer").setup({
                ensure_installed = {
                    "clangd", 
                    "cssls", 
                    "gopls",
                    "html",
                    "htmx",
                    "lua_ls",
                    "pyright",
                },
                auto_update = true,
                debounce_hours = 3,
            })

            local lspconfig = require('lspconfig')
		end,
}
