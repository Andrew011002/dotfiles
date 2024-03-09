return {
    { 
    "williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
			vim.keymap.set("n", "<leader>M", ":Mason <CR>", {})
		end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd", 
                    "cssls", 
                    "gopls",
                    "html",
                    "htmx",
                    "pyright",
                }
            })
        end,

    },
    {
        "neovim/nvim-lspconfig"
    },
}
