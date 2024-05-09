return {
	{ -- LSP Config & Setup
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({})
			vim.keymap.set("n", "<leader>M", ":Mason <CR>", {})
			local builtin = require("telescope.builtin")
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("LspBootUp", { clear = true }),
				callback = function(event)
					vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					vim.keymap.set(
						"n",
						"gD",
						vim.lsp.buf.declaration,
						{ buffer = event.buf, desc = "[G]oto [D]ecleration" }
					)
					vim.keymap.set(
						"n",
						"gd",
						builtin.lsp_definitions,
						{ buffer = event.buf, desc = "[G]oto [D]efinition" }
					)
					vim.keymap.set(
						"n",
						"gr",
						builtin.lsp_references,
						{ buffer = event.buf, desc = "[G]oto [R]eferences" }
					)
					vim.keymap.set(
						"n",
						"gI",
						builtin.lsp_implementations,
						{ buffer = event.buf, desc = "[G]oto [I]mplementations" }
					)
					vim.keymap.set(
						"n",
						"<leader>ds",
						builtin.lsp_document_symbols,
						{ buffer = event.buf, desc = "[D]ocument [S]ymbols" }
					)
					vim.keymap.set(
						"n",
						"<leader>ws",
						builtin.lsp_workspace_symbols,
						{ buffer = event.buf, desc = "[W]orkspace [S]ymbols" }
					)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = event.buf, desc = "[R]e[N]ame" })
					vim.keymap.set(
						"n",
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ buffer = event.buf, desc = "[C]ode [A]ctions" }
					)
					vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { buffer = event.buf, desc = "Hover" })
				end,
			})

			local servers = {
				clangd = {},
				cssls = {},
				gopls = {},
				html = {},
				htmx = {},
				lua_ls = {},
				pyright = {
					settings = {
						python = {
							analysis = {
								autoImportCompletions = false,
								diagnosticSeverityOverrides = {
									reportImportCycles = "warning",
									reportIncompatibleMethodOverride = false,
								},
							},
						},
					},
				},
				stylua = {},
			}

			local ensure_installed = vim.tbl_keys(servers or {})
			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
				auto_update = true,
			})

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						lspconfig[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{ -- Autoformat
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				notify_on_error = false,
				format_on_save = {
					timeout_ms = 250,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					go = { "gofmt" },
					lua = { "stylua" },
					python = { "black" },
				},
			})
		end,
	},

	{ -- Autocomple
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
		},
		config = function()
			local luasnip = require("luasnip")
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "...",
						show_labelDetails = true,
						symbol_map = {
							Text = "󰀬",
							Method = "󰆧",
							Function = "󰆧",
							Constructor = "󰆧",
							Field = "",
							Variable = "",
							Class = "",
							Interface = "",
							Module = "󰅩",
							Property = "",
							Unit = "",
							Value = "",
							Enum = "",
							Keyword = "",
							Snippet = "",
							Color = "",
							File = "",
							Reference = "",
							Folder = "",
							EnumMember = "",
							Constant = "",
							Struct = "",
							Event = "",
							Operator = "",
							Codeium = "",
							TypeParameter = "",
						},
					}),
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "codeium" },
				},
			})
		end,
	},
	{ -- Autopairs
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{ -- Comment
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({
				operator_mapping = "gc",
				line_mapping = "gcc",
			})
		end,
	},
}
