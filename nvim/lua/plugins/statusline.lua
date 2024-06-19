return {
	"sontungexpt/sttusline",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufEnter" },
	config = function(_, opts)
		require("sttusline").setup({
			statusline_color = "StatusLine",
			laststatus = 3,
			components = {
				"mode",
				"filename",
				"git-branch",
				"git-diff",
				"%=",
				"diagnostics",
				"indent",
				"encoding",
				"pos-cursor",
				"pos-cursor-progress",
			},
		})
	end,
}
