return {
	"feline-nvim/feline.nvim",
	config = function()
		local ctp_feline = require("catppuccin.groups.integrations.feline")
		local mocha = require("catppuccin.palettes").get_palette("mocha")
		ctp_feline.setup({
			assets = {
				left_separator = "",
				right_separator = "",
				mode_icon = "",
				dir = "󰉖",
				file = "󰈙",
				lsp = {
					server = "󰅡",
					error = "",
					warning = "",
					info = "",
					hint = "",
				},
				git = {
					branch = "",
					added = "",
					changed = "",
					removed = "",
				},
			},
			sett = {
				text = mocha.crust,
				bkg = mocha.crust,
				diffs = mocha.mauve,
				extras = mocha.surface0,
				curr_file = mocha.lavender,
				curr_dir = mocha.lavender,
				show_modified = true,
			},
			mode_colors = {
				["n"] = { "NORMAL", mocha.lavender },
				["no"] = { "N-PENDING", mocha.lavender },
				["i"] = { "INSERT", mocha.blue },
				["ic"] = { "INSERT", mocha.blue },
				["t"] = { "TERMINAL", mocha.blue },
				["v"] = { "VISUAL", mocha.red },
				["V"] = { "V-LINE", mocha.red },
				["�"] = { "V-BLOCK", mocha.red },
				["R"] = { "REPLACE", mocha.yellow },
				["Rv"] = { "V-REPLACE", mocha.yellow },
				["s"] = { "SELECT", mocha.maroon },
				["S"] = { "S-LINE", mocha.maroon },
				["�"] = { "S-BLOCK", mocha.maroon },
				["c"] = { "COMMAND", mocha.peach },
				["cv"] = { "COMMAND", mocha.peach },
				["ce"] = { "COMMAND", mocha.peach },
				["r"] = { "PROMPT", mocha.teal },
				["rm"] = { "MORE", mocha.teal },
				["r?"] = { "CONFIRM", mocha.mauve },
				["!"] = { "SHELL", mocha.green },
			},
		})
		require("feline").setup({
			components = ctp_feline.get(),
		})
	end,
}
