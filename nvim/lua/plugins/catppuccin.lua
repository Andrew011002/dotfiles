return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		local mocha_palette = require("catppuccin.palettes").get_palette("mocha")
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			term_colors = true,
			transparent_background = true,
			no_italic = true,
			no_bold = false,
			custom_highlights = function()
				return {
					["@function.method"] = { fg = mocha_palette.blue },
					["@comment"] = { fg = mocha_palette.base },
					["@constructor"] = { fg = mocha_palette.blue },
					["@attribute"] = { fg = mocha_palette.blue },
					["@variable.builtin"] = { fg = mocha_palette.yellow },
					["@variable"] = { fg = mocha_palette.text },
					["@variable.parameter"] = { fg = mocha_palette.maroon },
					["@punctuation.special"] = { fg = mocha_palette.overlay2 },
					["@operator"] = { fg = mocha_palette.overlay2 },
					["@character.special"] = { fg = mocha_palette.yellow },
					["@keyword"] = { fg = mocha_palette.mauve },
					["@keyword.import"] = { fg = mocha_palette.mauve },
					["@keyword.return"] = { fg = mocha_palette.mauve },
					["@keyword.function"] = { fg = mocha_palette.mauve },
					["@keyword.operator"] = { fg = mocha_palette.mauve },
				}
			end,
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
			},
			color_overrides = {
				mocha = {
					base = mocha_palette.crust,
					-- mantle = mocha_palette.crust,
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
