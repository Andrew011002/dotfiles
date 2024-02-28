return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("trouble").setup({
			vim.keymap.set("n", "<leader>xx", function()
				require("trouble").toggle()
			end),
			vim.keymap.set("n", "<leader>xw", function()
				require("trouble").toggle("workspace_diagnostics")
			end),
			vim.keymap.set("n", "<leader>xd", function()
				require("trouble").toggle("document_diagnostics")
			end),
			vim.keymap.set("n", "<leader>xq", function()
				require("trouble").toggle("quickfix")
			end),
			vim.keymap.set("n", "<leader>xl", function()
				require("trouble").toggle("loclist")
			end),
			vim.keymap.set("n", "<leader>xr", function()
				require("trouble").toggle("lsp_references")
			end),
			vim.keymap.set("n", "<leader>xc", function()
				require("trouble").close()
			end),
			vim.keymap.set("n", "<leader>xn", function()
				require("trouble").next({ skip_groups = true, jump = true })
			end),
			vim.keymap.set("n", "<leader>xp", function()
				require("trouble").previous({ skip_groups = true, jump = true })
			end),
			vim.keymap.set("n", "<leader>xf", function()
				require("trouble").first({ skip_groups = true, jump = true })
			end),
			vim.keymap.set("n", "<leader>xl", function()
				require("trouble").last({ skip_groups = true, jump = true })
			end),
		})
	end,
}
