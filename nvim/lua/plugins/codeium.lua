return {
	"Exafunction/codeium.nvim",
	event = "BufEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({})
		vim.keymap.set("n", "<leader>ce", function()
			vim.g.codeium_enabled = true
		end, { silent = true })
		vim.keymap.set("n", "<leader>cd", function()
			vim.g.codeium_enabled = false
		end, { silent = true })

		vim.keymap.set("n", "<leader>cg", function()
			if vim.g.codeium_render == nil or vim.g.codeium_render == false then
				vim.g.codeium_render = true
			else
				vim.g.codeium_render = false
			end
		end, { silent = true })

		vim.keymap.set("i", "<Tab>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<M-]>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<M-[>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<C-]>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })
	end,
}
