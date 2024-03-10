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

            local builtin =  require("telescope.builtin")

            vim.api.nvim_create_autocmd('LspAttach', {
              group = vim.api.nvim_create_augroup('LspBootUp', {clear = true}),
              callback = function(event)
                vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = event.buf, desc = "[G]oto [D]ecleration"})
              end,
            })

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
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
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
    }
}
