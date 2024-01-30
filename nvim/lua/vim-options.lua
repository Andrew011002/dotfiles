-- color support
vim.o.termguicolors = true

-- formatting
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- bindings
vim.api.nvim_set_keymap("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>h", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gt", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gT", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true })
for i = 1, 9 do
	vim.api.nvim_set_keymap("n", "g" .. i, ":buffer " .. i .. "<CR>", { noremap = true, silent = true })
end
