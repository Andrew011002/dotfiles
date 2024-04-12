vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.keymap.set("n", "<leader>L", ":Lazy <CR>", {})
local opts = {}

-- copy paste for WSL
local clip = "/mnt/c/Windows/System32/clip.exe"
if vim.fn.executable(clip) then
	opts = {
		callback = function()
			if vim.v.event.operator ~= "y" then
				return
			end
			vim.fn.system(clip, vim.fn.getreg(0))
		end,
	}

	opts.group = vim.api.nvim_create_augroup("WSLYank", {})
	vim.api.nvim_create_autocmd("TextYankPost", { group = opts.group, callback = opts.callback })
end

require("vim-options")
require("lazy").setup("plugins", opts)
