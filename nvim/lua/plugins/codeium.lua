return {
	"Exafunction/codeium.nvim",
	event = "BufEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({})
		vim.keymap.set("n", "<leader>ce", "<cmd>Codeium Enable<cr>", { desc = "[C]odeium [E]nable" })
		vim.keymap.set("n", "<leader>cd", "<cmd>Codeium Disable<cr>", { desc = "[C]odeium [D]isable" })
	end,
}
