return {
	{
		"catppuccin/nvim",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				no_italic = true,
				no_bold = true,
				no_underline = true,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	-- {
	-- 	"sontungexpt/witch",
	-- 	priority = 0,
	-- 	lazy = false,
	-- 	config = function(_, opts)
	-- 		require("witch").setup(opts)
	-- 	end,
	-- },
}
