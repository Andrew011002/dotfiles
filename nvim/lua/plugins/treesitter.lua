return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
                "astro",
				"c",
				"cpp",
                "css",
				"dockerfile",
				"go",
				"lua",
				"java",
				"javascript",
				"python",
				"vim",
				"vimdoc",
				"rust",
                "tsx",
				"typescript",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
