return { "catppuccin/nvim",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                no_italic = false, 
                no_bold = false, 
                no_underline = false, 
            })
            vim.cmd.colorscheme "catppuccin"
        end,
}
