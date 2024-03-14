return {
	"numToStr/FTerm.nvim",
	config = function()
		local fterm = require("FTerm")
		fterm.setup({
			border = "double",
			dimensions = {
				height = 0.9,
				width = 0.9,
			},
		})
		vim.keymap.set("n", "<leader>to", fterm.open, {})
		vim.keymap.set("n", "<leader>tc", fterm.close, {})
		vim.keymap.set("n", "<leader>tt", fterm.toggle, {})
		vim.keymap.set("n", "<leader>te", fterm.exit, {})
	end,
}
