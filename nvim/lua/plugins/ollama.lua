return {
	"David-Kunz/gen.nvim",
	config = function()
		require("gen").setup({
			model = "gemma", -- The default model to use.
			display_mode = "float", -- The display mode. Can be "float" or "split".
			show_prompt = false, -- Shows the Prompt submitted to Ollama.
			show_model = true, -- Displays which model you are using at the beginning of your chat session.
			quit_map = "q", -- set keymap for quit
			no_auto_close = false, -- Never closes the window automatically.
			vim.keymap.set({ "n", "v" }, "<leader><leader>", ":Gen<CR>"),
		})
	end,
}
