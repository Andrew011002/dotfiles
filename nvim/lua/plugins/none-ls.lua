return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua.with({
                    filetypes = { "lua" },
                }),
                --null_ls.builtins.formatting.autopep8.with({
                  --  filetypes = { "python" },
                --}),
                null_ls.builtins.formatting.isort.with({
                    filetypes = { "python" },
                }),
                null_ls.builtins.formatting.black.with({
                    filetypes = { "python" },
                }),
                null_ls.builtins.diagnostics.eslint.with({
                    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                }),
                null_ls.builtins.diagnostics.ruff.with({
                    filetypes = { "python" },
                }),
                null_ls.builtins.completion.spell,
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
