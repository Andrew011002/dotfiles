return {
    "nvim-treesitter/nvim-treesitter",
    build = "<cmd>TSUpdate",
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
        auto_install = true
    end,
}
