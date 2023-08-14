return {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    init = function()
      vim.opt.termguicolors = true
      vim.cmd [[highlight IndentBlanklineIndent1 guibg=#333333 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guibg=#2a2e38 gui=nocombine]]
    end,
    opts = {
        indentLine_enabled = 1,
        show_end_of_line = true,
        char = "",
        space_char_blankline = " ",
        char_highlight_list = {
            "IndentBlanklineIndent1", "IndentBlanklineIndent2"
        },
        space_char_highlight_list = {
            "IndentBlanklineIndent1", "IndentBlanklineIndent2"
        },
        filetype_exclude = {
            "startify", "dashboard", "dotooagenda", "log", "fugitive",
            "gitcommit", "packer", "vimwiki", "markdown", "json", "txt",
            "vista", "help", "todoist", "NvimTree", "peekaboo", "git",
            "TelescopePrompt", "undotree", "flutterToolsOutline", "" -- for all buffers without a file type
        },
        buftype_exclude = {"terminal", "nofile"},
        show_trailing_blankline_indent = false,
        show_first_indent_level = true,
        show_current_context = true,
        show_current_context_start = true,
        -- char_list = {"|", "¦", "┆", "┊"},
        space_char = " ",
        context_patterns = {
            "class", "function", "method", "block", "list_literal", "selector",
            "^if", "^table", "if_statement", "while", "for"
        }

    }
}
