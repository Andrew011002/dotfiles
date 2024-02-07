-- color support
vim.o.termguicolors = true

-- longer time to press
vim.o.timeoutlen = 1000

-- formatting
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- bindings

-- tabbing
vim.api.nvim_set_keymap("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>", ">>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", "<<", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- window nav
vim.api.nvim_set_keymap("n", "<leader>h", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", "<C-w>l", { noremap = true, silent = true })

-- save
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

-- pane nav
vim.api.nvim_set_keymap("n", "gt", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gT", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":bd<CR>", { noremap = true, silent = true })
