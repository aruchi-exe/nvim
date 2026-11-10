return {
    pack = {
        { src = "https://github.com/FylerOrg/fyler.nvim" },
    },
    config = function()
        require("fyler").setup({
            kind = "floating",
            ui = {
                indent_guides = true,
            },
            integrations = {
                icon = "nvim_web_devicons",
            },
        })

        vim.keymap.set("n", "<leader>e", ":Fyler <CR>", { desc = "file [e]xplorer" })
    end,
}
