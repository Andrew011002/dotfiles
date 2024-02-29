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

-- quit window
vim.api.nvim_set_keymap("n", "<leader>qw", ":bd<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>qq", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>qa", ":qa<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q!", ":qa!<CR>", { noremap = true, silent = true })

-- buffer nav
vim.api.nvim_set_keymap("n", "<C-b>", "<C-b>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-f>", "<C-f>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "n", "nzz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzz", { noremap = true, silent = true })

-- save
vim.api.nvim_set_keymap("n", "<leader>ww", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>wq", ":wq<CR>", { noremap = true, silent = true })

-- pane nav
vim.api.nvim_set_keymap("n", "gt", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gT", ":bprevious<CR>", { noremap = true, silent = true })
