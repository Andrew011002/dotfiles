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
            })

            local lspconfig = require('lspconfig')
            local builtin =  require("telescope.builtin")

            vim.api.nvim_create_autocmd('LspAttach', {
              group = vim.api.nvim_create_augroup('LspBootUp', {clear = true}),
              callback = function(event)
                vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                local opts = { buffer = event.buf }
            
                vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, {opts, desc = "[G]oto [D]efinition"})
                vim.keymap.set("n", "gr", builtin.lsp_references, {opts, desc = "[G]oto [R]eferences"})
                vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, {opts, desc = "[D]ocument [S]ymbols"})
                vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, {opts, desc = "[W]ork [S]pace Symbols"})
                vim.keymap.set("n", "<leader>gI", builtin.lsp_implementations, {opts, desc = "[G]oto Implementations"})
              end,
            })

--            local capabilities = require("cmp_nvim_lsp").default_capabilities()
		end,
}
