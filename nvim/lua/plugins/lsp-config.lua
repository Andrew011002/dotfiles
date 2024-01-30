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
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			lspconfig.golangci_lint_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					pyright = {
						disableLanguageServices = false,
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
                            logLevel = "information",
							autoImportCompletions = false,
							diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = "true",
                            typeCheckingMode = "false",
                            autoSearchPaths = "true",
							diagnosticSeverityOverrides = {
                                strictParameterNoneValue = "information",
                                reportImportCycles = "warning",
                                reportInconsistentOverload = "false",
                                reportPossiblyUnboundVariable = "information",
                                reportImplicitOverride = "false",
                                reportIndexIssue = "error",
                            }, -- specify overrides here
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
