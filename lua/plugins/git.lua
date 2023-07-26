return {
    {
        "f-person/git-blame.nvim",
        lazy = true,
        config = function()
            vim.g.gitblame_enabled = 0
        end
    }, {
        "lewis6991/gitsigns.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        event = "BufReadPre",
        config = function()
            require("gitsigns").setup {
                keymaps = {
                    -- Default keymap options
                    noremap = false
                },
                signs = {
                    add = {
                        hl = "GitSignsAdd",
                        text = "│",
                        numhl = "GitSignsAddNr",
                        linehl = "GitSignsAddLn"
                    },
                    change = {
                        hl = "GitSignsChange",
                        text = "│",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn"
                    },
                    delete = {
                        hl = "GitSignsDelete",
                        text = "_",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn"
                    },
                    topdelete = {
                        hl = "GitSignsDelete",
                        text = "❗",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn"
                    },
                    changedelete = {
                        hl = "GitSignsChange",
                        text = "~",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn"
                    }
                },
                signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {interval = 1000, follow_files = true},
                attach_to_untracked = true,
                -- git-blame provides also the time in contrast to gitsigns
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_formatter_opts = {relative_time = false},
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                max_file_length = 40000,
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = "single",
                    style = "minimal",
                    relative = "cursor",
                    row = 0,
                    col = 1
                },
                diff_opts = {internal = true},
                yadm = {enable = false}
            }
        end
    }, {
        "TimUntersberger/neogit",
        dependencies = {"nvim-lua/plenary.nvim"},
        cmd = "Neogit",
        config = function()
            local neogit = require("neogit")

            neogit.setup {
                disable_signs = false,
                disable_context_highlighting = false,
                disable_commit_confirmation = true,
                -- customize displayed signs
                signs = {
                    -- { CLOSED, OPENED }
                    section = {">", "v"},
                    item = {">", "v"},
                    hunk = {"", ""}
                },
                kind = "vsplit",
                integrations = {diffview = true},
                -- override/add mappings
                mappings = {
                    -- modify status buffer mappings
                    status = {
                        -- Adds a mapping with "B" as key that does the "BranchPopup" command
                        ["B"] = "BranchPopup"
                        -- ["C"] = "CommitPopup",
                        -- ["P"] = "PullPopup",
                        -- ["S"] = "Stage",
                        -- ["D"] = "Discard",
                        -- Removes the default mapping of "s"
                        -- ["s"] = "",
                    }
                }
            }
        end
    }
}
