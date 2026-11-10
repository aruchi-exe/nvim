return {
    pack = {
        { src = "https://github.com/nvim-mini/mini.comment", version = "stable" },
        { src = "https://github.com/nvim-mini/mini.pairs", version = "stable" },
        { src = "https://github.com/nvim-mini/mini.surround", version = "stable" },
    },
    config = function()
        local comment = require("mini.comment")
        local pairs = require("mini.pairs")
        local surround = require("mini.surround")
        comment.setup({})
        pairs.setup({})
        surround.setup({
            mappings = {
                add = "sa", -- Add surrounding in Normal and Visual modes
                delete = "sd", -- Delete surrounding
                find = "sf", -- Find surrounding (to the right)
                find_left = "sF", -- Find surrounding (to the left)
                highlight = "sh", -- Highlight surrounding
                replace = "sr", -- Replace surrounding

                suffix_last = "l", -- Suffix to search with "prev" method
                suffix_next = "n", -- Suffix to search with "next" method
            },
        })
    end,
}
