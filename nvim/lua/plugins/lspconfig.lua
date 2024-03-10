return {
        {"neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
		config = function()
			require("mason").setup({})
			vim.keymap.set("n", "<leader>M", ":Mason <CR>", {})

            -- lsp bindings
            local builtin =  require("telescope.builtin")
            vim.api.nvim_create_autocmd('LspAttach', {
              group = vim.api.nvim_create_augroup('LspBootUp', {clear = true}),
              callback = function(event)
                vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = "[G]oto [D]ecleration"})
                vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = event.buf, desc = "[G]oto [D]efinition"})
                vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = event.buf, desc = "[G]oto [R]eferences"})
                vim.keymap.set("n", "gI", builtin.lsp_implementations, { buffer = event.buf, desc = "[G]oto [I]mplementations"})
                vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { buffer = event.buf, desc = "[D]ocument [S]ymbols"})
                vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, { buffer = event.buf, desc = "[W]orkspace [S]ymbols"})
              end,
            })


            -- language server config and setup
            local servers = { clangd = {}, 
                                cssls = {}, 
                                gopls = {}, 
                                html = {}, 
                                htmx = {}, 
                                lua_ls = {}, 
                                pyright = {}, 
                                stylua = {}, 
                            }

            local ensure_installed = vim.tbl_keys(servers or {})
            require('mason-tool-installer').setup { 
                                    ensure_installed = ensure_installed,
                                    auto_update = true
            }

            local lspconfig = require('lspconfig')
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require('mason-lspconfig').setup {
                    handlers = {
                      function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                        lspconfig[server_name].setup(server)
                      end,
                    },
                  }
		end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip"
        },
        config = function()
        end,
    }
}
