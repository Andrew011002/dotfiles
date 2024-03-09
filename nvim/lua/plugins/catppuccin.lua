return { "catppuccin/nvim",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "machiatto",
            })
            vim.cmd.colorscheme "catppuccin"
        end,
}
