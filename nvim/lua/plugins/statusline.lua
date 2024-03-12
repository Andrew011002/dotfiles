return {
	"feline-nvim/feline.nvim",
	config = function()
		local ctp_feline = require("catppuccin.groups.integrations.feline")
		local macchiato = require("catppuccin.palettes").get_palette("macchiato")
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
				text = macchiato.crust,
				bkg = macchiato.base,
				diffs = macchiato.mauve,
				extras = macchiato.surface2,
				curr_file = macchiato.lavender,
				curr_dir = macchiato.lavender,
				show_modified = true,
			},
			mode_colors = {
				["n"] = { "NORMAL", macchiato.lavender },
				["no"] = { "N-PENDING", macchiato.lavender },
				["i"] = { "INSERT", macchiato.blue },
				["ic"] = { "INSERT", macchiato.blue },
				["t"] = { "TERMINAL", macchiato.blue },
				["v"] = { "VISUAL", macchiato.red },
				["V"] = { "V-LINE", macchiato.red },
				["cv"] = { "V-BLOCK", macchiato.red },
				["R"] = { "REPLACE", macchiato.yellow },
				["Rv"] = { "V-REPLACE", macchiato.yellow },
				["s"] = { "SELECT", macchiato.maroon },
				["S"] = { "S-LINE", macchiato.maroon },
				["�"] = { "S-BLOCK", macchiato.maroon },
				["c"] = { "COMMAND", macchiato.peach },
				["ce"] = { "COMMAND", macchiato.peach },
				["r"] = { "PROMPT", macchiato.teal },
				["rm"] = { "MORE", macchiato.teal },
				["r?"] = { "CONFIRM", macchiato.mauve },
				["!"] = { "SHELL", macchiato.green },
			},
		})
		require("feline").setup({
			components = ctp_feline.get(),
		})
	end,
}
