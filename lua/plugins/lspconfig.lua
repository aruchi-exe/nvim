return {
    pack = {
        { src = "https://github.com/neovim/nvim-lspconfig" },
    },
    config = function()
        vim.lsp.enable({
            "lua_ls",
        })

        vim.lsp.config("lua_ls", {
            cmd = { "lua-language-server" },
            filetypes = { "lua" },
            root_markers = { ".luarc.json", ".luarc.jsonc" },
            telemetry = { enabled = false },
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("lua", true),
                    },
                    signatureHelp = { enabled = true },
                },
            },
        })
    end,
}
