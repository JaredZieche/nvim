return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        dependencies = {"nvim-tree/nvim-web-devicons", lazy = true},
        opts = {
            options = {
                icons_enabled = true,
                theme = "material-nvim",
                component_separators = {left = "", right = ""},
                section_separators = {left = "", right = ""},
                disabled_filetypes = {},
                globalstatus = true
            },
            sections = {
                lualine_a = {{"mode"}},
                lualine_b = {
                    "branch", {
                        "diff",
                        colored = true,
                        symbols = {
                            added = " ",
                            modified = " ",
                            removed = " "
                        },
                        source = nil
                    }
                },
                lualine_c = {
                    "filename",
                    {"diagnostics", colored = true, sources = {"nvim_lsp"}}
                },
                lualine_x = {"encoding", "fileformat", "filetype"},
                lualine_y = {"progress"},
                lualine_z = {"location"}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {"filename"},
                lualine_x = {"location"},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = {"nvim-tree", "toggleterm", "quickfix"},
            winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {{"filename", path = 1}},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            inactive_winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {"filename"},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            }
        }
    }
}
