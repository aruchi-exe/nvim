return {
    pack = {
        { src = "https://github.com/rebelot/terminal.nvim" },
    },
    config = function()
        require("terminal").setup({})

        local term_map = require("terminal.mappings")

        vim.keymap.set({ "n", "x" }, "<leader>ts", term_map.operator_send, { expr = true })
        vim.keymap.set("n", "<leader>to", term_map.toggle, { desc = "[t]erminal t[o]ggle" })
        vim.keymap.set("n", "<leader>tr", term_map.run, { desc = "[t]erminal [r]un" })
        vim.keymap.set("n", "<leader>tk", term_map.kill, { desc = "[t]erminal [k]ill" })
    end,
}
