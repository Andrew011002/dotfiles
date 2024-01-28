return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"cpp",
				"dockerfile",
				"go",
				"lua",
				"java",
				"javascript",
				"python",
				"vim",
				"vimdoc",
				"rust",
				"typescript",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
