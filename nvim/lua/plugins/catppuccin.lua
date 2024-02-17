return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        local mocha_palette = require("catppuccin.palettes").get_palette("mocha")
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            term_colors = true,
            transparent_background = false,
            no_italic = true,
            no_bold = false,
            styles = {
                comments = {},
                conditionals = {},
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
            },
            color_overrides = {
                mocha = {
                    base = mocha_palette.crust,
                    mantle = mocha_palette.mantle,
                },
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
