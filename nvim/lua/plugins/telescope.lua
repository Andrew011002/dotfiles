return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
			file_ignore_patterns = {
				"venv",
				"node_modules",
				"build",
				"dist",
				"yarn.lock",
			},
		})
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind Files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live [G]rep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp tags" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
		vim.keymap.set("n", "<leader>km", builtin.keymaps, { desc = "Find [K]ey [M]aps" })
		vim.keymap.set("n", "<leader>cs", builtin.colorscheme, { desc = "Find [C]olor [S]chemes" })
		require("telescope").load_extension("ui-select")
	end,
}
