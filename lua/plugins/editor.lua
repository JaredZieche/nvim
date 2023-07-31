function get_config(name)
  return string.format("require(\"notconfig/%s\")", name)
end

return {
    "ahmedkhalf/project.nvim",
    {
        "natecraddock/workspaces.nvim",
        opts = {
            -- to change directory for all of nvim (:cd) or only for the current window (:lcd)
            -- if you are unsure, you likely want this to be true.
            global_cd = true,

            -- sort the list of workspaces by name after loading from the workspaces path.
            sort = true,

            -- enable info-level notifications after adding or removing a workspace
            notify_info = true,

            -- lists of hooks to run after specific actions
            -- hooks can be a lua function or a vim command (string)
            -- if only one hook is needed, the list may be omitted
            hooks = {
                add = {},
                remove = {},
                open_pre = {},
                open = {"Telescope find_files"},
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        keys = {"<leader>ff"},
        cmd = "Telescope",
        lazy = false,
        version = false,
        dependencies = {
            "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim",
            "burntsushi/ripgrep", "sharkdp/fd",
            "ANGkeith/telescope-terraform-doc.nvim",
        },
        config = function()
          get_config("telescope")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts = {
          sync_root_with_cwd = true,
          respect_buf_cwd = true,
          update_focused_file = {
            enable = true,
            update_root = true
          },
        },
        config = true,
    }, {
        "karb94/neoscroll.nvim",
        keys = {"<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-e>", "zt", "zz", "zb"},
    }, {
        "folke/which-key.nvim",
        keys = {"<leader>"},
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {plugins = {spelling = true}},
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)

            -- register non leader based mappings
            wk.register({ga = {"<Plug>(EasyAlign)", "Align", mode = "x"}})

            -- Register all leader based mappings
            wk.register({
                ["<Tab>"] = {
                    "<cmd>e#<cr>", "Switch to previously opened buffer",
                },
                b = {
                    name = "Buffers",
                    b = {
                        "<cmd>lua require'telescope.builtin'.buffers({ sort_mru = true, ignore_current_buffer = true })<cr>",
                        "Find buffer",
                    },
                    d = {"<cmd>Bdelete!<CR>", "Close Buffer"},
                    f = {"<cmd>BufferLinePick<cr>", "Pick buffer"},
                    l = {
                        "<cmd>BufferLineCloseLeft<cr>",
                        "close all buffers to the left",
                    },
                    p = {"<cmd>BufferLineMovePrev<cr>", "Move buffer prev"},
                    n = {"<cmd>BufferLineMoveNext<cr>", "Move buffer next"},
                    r = {
                        "<cmd>BufferLineCloseRight<cr>",
                        "close all BufferLines to the right",
                    },
                    x = {
                        "<cmd>BufferLineSortByDirectory<cr>",
                        "sort BufferLines automatically by directory",
                    },
                    L = {
                        "<cmd>BufferLineSortByExtension<cr>",
                        "sort BufferLines automatically by extension",
                    },
                },
                f = {
                    name = "Files",
                    s = {"<cmd>w<cr>", "Save Buffer"},
                    f = {"<cmd>Telescope find_files<cr>", "Find File"},
                    p = {"<cmd>NvimTreeToggle<cr>", "Toogle Tree"},
                    r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
                    b = {"<cmd>SidebarNvimToggle<cr>", "Toggle SideBar"},
                    T = {"<cmd>NvimTreeFindFile<CR>", "Find in Tree"},
                },
                g = {
                    name = "Git",
                    j = {
                        "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
                        "Next Hunk",
                    },
                    k = {
                        "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
                        "Prev Hunk",
                    },
                    p = {
                        "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
                        "Preview Hunk",
                    },
                    r = {
                        "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
                        "Reset Hunk",
                    },
                    R = {
                        "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
                        "Reset Buffer",
                    },
                    s = {
                        "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
                        "Stage Hunk",
                    },
                    t = "Open Gitui", -- comand in toggleterm.lua
                    n = {"<cmd>Neogit<cr>", "Open Neogit"},
                    u = {
                        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
                        "Undo Stage Hunk",
                    },
                    g = {"<cmd>Telescope git_status<cr>", "Open changed file"},
                    b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
                    B = {"<cmd>GitBlameToggle<cr>", "Toogle Blame"},
                    c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
                    C = {
                        "<cmd>Telescope git_bcommits<cr>",
                        "Checkout commit(for current file)",
                    },
                },
                h = {
                    name = "Harpoon",
                    a = {
                        "<cmd>lua require('harpoon.mark').add_file()<cr>",
                        "Add file",
                    },
                    u = {"<cmd>Telescope harpoon marks<cr>", "Open Menu"},
                    ["1"] = {
                        "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
                        "Open File 1",
                    },
                    ["2"] = {
                        "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
                        "Open File 2",
                    },
                    ["3"] = {
                        "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
                        "Open File 3",
                    },
                    ["4"] = {
                        "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
                        "Open File 4",
                    },
                },
                j = {
                    name = "leap",
                    l = {
                        "<cmd>lua require'leap'.leap { target_windows = { vim.fn.win_getid() } }<cr>",
                        "leap",
                    },
                },
                l = {
                    name = "LSP",
                    a = {
                        "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action",
                    },
                    d = {
                        "<cmd>Telescope lsp_document_diagnostics<cr>",
                        "Document Diagnostics",
                    },
                    w = {
                        "<cmd>Telescope lsp_workspace_diagnostics<cr>",
                        "Workspace Diagnostics",
                    },
                    -- f = { "<cmd>silent FormatWrite<cr>", "Format" },
                    f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"},
                    i = {"<cmd>LspInfo<cr>", "Info"},
                    j = {
                        "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>",
                        "Next Diagnostic",
                    },
                    k = {
                        "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
                        "Prev Diagnostic",
                    },
                    q = {
                        "<cmd>lua vim.lsp.diagnostic.setloclist()<cr>",
                        "Quickfix",
                    },
                    r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
                    s = {
                        "<cmd>Telescope lsp_document_symbols<cr>",
                        "Document Symbols",
                    },
                    S = {
                        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
                        "Workspace Symbols",
                    },
                },
                m = {
                    name = "Misc",
                    s = {"<cmd>SymbolsOutline<cr>", "Toggle SymbolsOutline"},
                },
                s = {
                    name = "Search",
                    c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
                    h = {"<cmd>Telescope help_tags<cr>", "Find Help"},
                    M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
                    R = {"<cmd>Telescope registers<cr>", "Registers"},
                    t = {"<cmd>Telescope live_grep<cr>", "Text"},
                    s = {"<cmd>Telescope grep_string<cr>", "Text under cursor"},
                    k = {"<cmd>Telescope keymaps<cr>", "Keymaps"},
                    C = {"<cmd>Telescope commands<cr>", "Commands"},
                    p = {"<cmd>Telescope projects<cr>", "Projects"},
                    P = {
                        "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
                        "Colorscheme with Preview",
                    },
                    w = {"<cmd>Telescope workspaces<cr>", "Workspaces"},
                },
                t = {
                    name = "Trouble",
                    w = {
                        "<cmd>Trouble workspace_diagnostics<cr>",
                        "Workspace Diagnostics",
                    },
                    d = {
                        "<cmd>Trouble document_diagnostics<cr>",
                        "Document Diagnostic",
                    },
                    l = {"<cmd>Trouble loclist<cr>", "Loclist"},
                    q = {"<cmd>Trouble quickfix<cr>", "Quickfix"},
                    t = {"<cmd>TodoTrouble<cr>", "Todos"},
                    r = {"<cmd>Trouble lsp_references<cr>", "LSP References"},
                },
                w = {
                    name = "Window",
                    q = {"<cmd>:q<cr>", "Close"},
                    s = {"<cmd>:split<cr>", "Horizontal Split"},
                    t = {"<c-w>t", "Move to new tab"},
                    ["="] = {"<c-w>=", "Equally size"},
                    v = {"<cmd>:vsplit<cr>", "Verstical Split"},
                    w = {"<c-w>x", "Swap"},
                },
                x = {
                    name = "LanguageTool",
                    c = {"<cmd>GrammarousCheck<cr>", "Grammar check"},
                    i = {
                        "<Plug>(grammarous-open-info-window)",
                        "Open the info window",
                    },
                    r = {"<Plug>(grammarous-reset)", "Reset the current check"},
                    f = {
                        "<Plug>(grammarous-fixit)",
                        "Fix the error under the cursor",
                    },
                    x = {
                        "<Plug>(grammarous-close-info-window)",
                        "Close the information window",
                    },
                    e = {
                        "<Plug>(grammarous-remove-error)",
                        "Remove the error under the cursor",
                    },
                    n = {
                        "<Plug>(grammarous-move-to-next-error)",
                        "Move cursor to the next error",
                    },
                    p = {
                        "<Plug>(grammarous-move-to-previous-error)",
                        "Move cursor to the previous error",
                    },
                    d = {
                        "<Plug>(grammarous-disable-rule)",
                        "Disable the grammar rule under the cursor",
                    },
                },
                z = {
                    name = "Spelling",
                    n = {"]s", "Next"},
                    p = {"[s", "Previous"},
                    a = {"zg", "Add word"},
                    f = {"1z=", "Use 1. correction"},
                    l = {"<cmd>Telescope spell_suggest<cr>", "List corrections"},
                },
            }, {prefix = "<leader>", mode = "n", default_options})
        end,
    }, {
        "stevearc/aerial.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("aerial").setup({
                on_attach = function(bufnr)
                    -- Toggle the aerial window with <leader>a
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>a",
                                                "<cmd>AerialToggle!<CR>", {})
                    -- Jump forwards/backwards with '{' and '}'
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "{",
                                                "<cmd>AerialPrev<CR>", {})
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "}",
                                                "<cmd>AerialNext<CR>", {})
                    -- Jump up the tree with '[[' or ']]'
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "[[",
                                                "<cmd>AerialPrevUp<CR>", {})
                    vim.api.nvim_buf_set_keymap(bufnr, "n", "]]",
                                                "<cmd>AerialNextUp<CR>", {})
                end,
            })
        end,
    },
    {
      "karb94/neoscroll.nvim",
      config = true
    },
    {
        "numToStr/Navigator.nvim",
        config = function()
            local map = vim.api.nvim_set_keymap
            -- tmux navigation
            map("n", "<C-h>", "<cmd>lua require('Navigator').left()<CR>",
                default_options)
            map("n", "<C-k>", "<cmd>lua require('Navigator').up()<CR>",
                default_options)
            map("n", "<C-l>", "<cmd>lua require('Navigator').right()<CR>",
                default_options)
            map("n", "<C-j>", "<cmd>lua require('Navigator').down()<CR>",
                default_options)
        end,
    },
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    {"kevinhwang91/nvim-bqf", dependencies = {"junegunn/fzf"}},
}
