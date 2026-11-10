return {
    pack = {
        { src = "https://github.com/saghen/blink.lib" },
        { src = "https://github.com/saghen/blink.cmp" },
    },
    config = function()
        local cmp = require("blink.cmp")

        cmp.build():pwait()

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        local config = {
            keymap = {
                preset = "super-tab",
            },
            completion = {
                ghost_text = {
                    enabled = true,
                    show_with_menu = true,
                },
                menu = {
                    auto_show = true,
                    draw = {
                        padding = 2,
                        columns = {
                            { "kind_icon" },
                            { "label", "label_description", gap = 1 },
                        },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                },
            },
            sources = { default = { "lsp", "path", "snippets", "buffer" } },
            fuzzy = { implementation = "rust" },
        }

        cmp.setup(config)
    end,
}
