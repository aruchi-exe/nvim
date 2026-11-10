return {
    pack = {
        { src = "https://github.com/mason-org/mason.nvim" },
        { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    },
    config = function()
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "stylua",
                "tombi",
                "ts_ls",
                "vue_ls",
            },
        })

        vim.keymap.set("n", "<leader>m", ":Mason<CR>", { desc = "[m]ason" })
        vim.keymap.set("n", "<leader>mu", ":MasonUpdate<CR>", { desc = "[m]ason [u]pdate" })
    end,
}
