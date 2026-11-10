return {
    pack = {
        { src = "https://github.com/DNLHC/glance.nvim", cmd = "Glance" },
    },
    config = function()
        require("glance").setup({
            border = {
                enable = true,
                top_char = "―",
                bottom_char = "―",
            },
        })

        vim.keymap.set("n", "gd", "<CMD>Glance definitions<CR>", { desc = "[g]lance [d]definitions" })
        vim.keymap.set("n", "gr", "<CMD>Glance references<CR>", { desc = "[g]lance [r]references" })
        vim.keymap.set("n", "gy", "<CMD>Glance type_definitions<CR>", { desc = "[g]lance t[y]pe definitions" })
        vim.keymap.set("n", "gm", "<CMD>Glance implementations<CR>")
    end,
}
