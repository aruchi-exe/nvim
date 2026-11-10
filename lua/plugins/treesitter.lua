return {
    pack = {
        { src = "https://github.com/nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    },
    config = function()
        require("nvim-treesitter").install({
            "javascript",
            "jsx",
            "lua",
            "markdown",
            "toml",
            "tsx",
            "typescript",
            "vue",
        })
    end,
}
