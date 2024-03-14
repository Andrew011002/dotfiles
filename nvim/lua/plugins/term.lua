return {
	"numToStr/FTerm.nvim",
	config = function()
		local fterm = require("FTerm")
		fterm.setup({
			border = "double",
			dimensions = {
				height = 0.5,
				width = 0.5,
			},
		})
		vim.keymap.set({ "t", "n" }, "<C-a>", fterm.toggle, {})
		vim.keymap.set("t", "<C-c>", fterm.exit, {})
	end,
}
