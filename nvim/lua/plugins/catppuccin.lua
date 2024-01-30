return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			term_colors = true,
			transparent_background = false,
			no_italic = true,
			no_bold = false,
			styles = {
				comments = {},
				conditionals = {"bold"},
				loops = {"bold"},
				functions = {"bold"},
				keywords = {"bold"},
				strings = {},
				variables = {"bold"},
				numbers = {"bold"},
				booleans = {"bold"},
				properties = {"bold"},
				types = {},
			},
			highlight_overrides = {
				mocha = function(C)
					return {
						TabLineSel = { bg = C.pink },
						CmpBorder = { fg = C.surface2 },
						Pmenu = { bg = C.none },
						TelescopeBorder = { link = "FloatBorder" },
					}
				end,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
