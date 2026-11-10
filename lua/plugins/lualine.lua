return {
    pack = {
        { src = "https://github.com/nvim-lualine/lualine.nvim" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    },
    config = function()
        -- Resolve foreground from a highlight group at render time, so colors follow the active colorscheme.
        local function fg(group, fallback)
            return function()
                local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
                return hl.fg and { fg = string.format("#%06x", hl.fg), gui = "bold" } or fallback
            end
        end

        require("lualine").setup({
            options = {
                globalstatus = true,
                component_separators = "",
                section_separators = "",
                icons_enabled = true,
                theme = "auto",
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        function()
                            return "█"
                        end,
                        color = fg("Function"),
                        padding = { left = 0, right = 1 },
                    },
                    {
                        function()
                            local mode_names = {
                                n = "NORMAL",
                                i = "INSERT",
                                v = "VISUAL",
                                [" "] = "V-BLOCK",
                                V = "V-LINE",
                                c = "COMMAND",
                                R = "REPLACE",
                            }
                            return mode_names[vim.fn.mode()] or vim.fn.mode()
                        end,
                        color = function()
                            local mode_group = {
                                n = "DiagnosticWarn",
                                i = "DiagnosticOk",
                                v = "Keyword",
                                [" "] = "Keyword",
                                V = "Keyword",
                                c = "DiagnosticInfo",
                                R = "DiagnosticError",
                            }
                            return fg(mode_group[vim.fn.mode()] or "DiagnosticError")()
                        end,
                    },
                    { "filename", color = fg("Statement") },
                    { "branch", icon = "", color = fg("Keyword") },
                    { "diff", symbols = { added = " ", modified = "󰝤 ", removed = " " } },
                },
                lualine_x = {
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                        color = fg("Constant"),
                    },
                    {
                        function()
                            local msg = "none"
                            local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
                            local clients = vim.lsp.get_clients()
                            if next(clients) == nil then
                                return msg
                            end
                            for _, client in ipairs(clients) do
                                local filetypes = client.config.filetypes
                                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                    return client.name
                                end
                            end
                            return msg
                        end,
                        icon = " ",
                    },
                    { "encoding", fmt = string.upper, color = fg("DiagnosticOk") },
                    { "fileformat", fmt = string.upper },
                    { "progress", color = fg("DiagnosticWarn") },
                    { "location", color = fg("Function") },
                },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
