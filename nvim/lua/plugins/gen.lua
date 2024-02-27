return {
	"David-Kunz/gen.nvim",
	config = function()
		require("gen").setup({
            model = "gemma",
            show_model = true,
            show_prompt = true,
			vim.keymap.set({ "n", "v" }, "<leader>]", ":Gen<CR>"),
		})
	end,
}
