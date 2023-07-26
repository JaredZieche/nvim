return {
    "marko-cerovac/material.nvim",
    lazy = false,
    config = function()
        vim.g.material_style = "palenight"

        vim.cmd "colorscheme material"
        -- Enable style toggling for material
        vim.api.nvim_set_keymap("n", "mm",
                                [[<Cmd>lua require('material.functions').toggle_style()<CR>]],
                                default_options)
        require("material").setup {
            contrast = {
                sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
                floating_windows = true, -- Enable contrast for floating windows
                line_numbers = true, -- Enable contrast background for line numbers
                sign_column = true, -- Enable contrast background for the sign column
                cursor_line = false, -- Enable darker background for the cursor line
                non_current_windows = false, -- Enable darker background for non-current windows
                popup_menu = false -- Enable lighter background for the popup menu
            },

            italics = {
                comments = false, -- Enable italic comments
                keywords = false, -- Enable italic keywords
                functions = false, -- Enable italic functions
                strings = false, -- Enable italic strings
                variables = false -- Enable italic variables
            },

            contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
                "terminal", -- Darker terminal background
                "packer", -- Darker packer background
                "qf" -- Darker qf list background
            },

            high_visibility = {
                lighter = false, -- Enable higher contrast text for lighter style
                darker = false -- Enable higher contrast text for darker style
            },

            disable = {
                borders = false, -- Disable borders between verticaly split windows
                background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
                term_colors = false, -- Prevent the theme from setting terminal colors
                eob_lines = false -- Hide the end-of-buffer lines
            },

            async_loading = true,

            custom_highlights = {
                DiffAdd = {bg = "#344a4d", fg = "NONE"},
                DiffDelete = {bg = "#4b3346", fg = "NONE"},
                DiffChange = {bg = "#32395c", fg = "NONE"},
                DiffText = {bg = "#3f4a87", fg = "NONE"},
                diffChanged = {fg = "#82b1ff"}
            } -- Overwrite highlights with your own
        }
    end
}
