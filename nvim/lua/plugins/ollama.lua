return {
	"David-Kunz/gen.nvim",
	config = function()
		require("gen").setup({
			model = "mixtral",
			display_mode = "float",
			show_prompt = false,
			show_model = true,
			quit_map = "q",
			no_auto_close = false,
			vim.keymap.set({ "n", "v" }, "<leader>]", ":Gen<CR>"),
		})
	end,
}
