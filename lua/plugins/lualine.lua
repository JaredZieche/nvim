return {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = {"nvim-tree/nvim-web-devicons", lazy = true},
    config = function()
        require"lualine".setup {
            options = {
                icons_enabled = true,
                theme = "material-nvim",
                component_separators = {left = "", right = ""},
                section_separators = {left = "", right = ""},
                disabled_filetypes = {},
                globalstatus = true
            },
            sections = {
                lualine_a = {"mode"},
                lualine_b = {"branch", "diff"},
                lualine_c = {"filename"},
                lualine_x = {
                    {"diagnostics", sources = {"nvim_lsp"}}, "encoding",
                    "fileformat", "filetype"
                },
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
                lualine_c = {"filename"},
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
    end
}
