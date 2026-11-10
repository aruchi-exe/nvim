return {
    pack = {
        { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/nvim-telescope/telescope.nvim" },
    },
    config = function()
        require("telescope").setup({})

        vim.keymap.set("n", "<leader><leader>", ":Telescope find_files <CR>", { desc = "telescope" })
        vim.keymap.set("n", "<leader>fb", ":Telescope buffers <CR>", { desc = "[f]ind [b]uffer" })
        vim.keymap.set("n", "<leader>fh", ":Telescope help_tags <CR>", { desc = "[f]ind [b]uffer" })
    end,
}
