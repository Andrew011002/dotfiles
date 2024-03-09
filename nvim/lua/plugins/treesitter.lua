return {"nvim-treesitter/nvim-treesitter",
    config = function()
        ensure_installed = {
            "c",
            "cpp",
            "css",
            "go",
            "html",
            "lua",
            "luadoc",
            "python",
            "vim",
            "vimdoc",
        }
        highlight = {enable = true}
        indent = { enable = true}
    end,
}
