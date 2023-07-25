local execute = vim.api.nvim_command
local fn = vim.fn
vim.g.mapleader = " "
return {
    "nvim-treesitter/nvim-treesitter-textobjects", "numToStr/Navigator.nvim",
    "famiu/bufdelete.nvim", "neovim/nvim-lspconfig", "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim", "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip", "mhartington/formatter.nvim",
    "tweekmonster/startuptime.vim", "glepnir/dashboard-nvim",
    "stevearc/aerial.nvim", "p00f/nvim-ts-rainbow", "f-person/git-blame.nvim",
    "junegunn/vim-easy-align", "rhysd/vim-grammarous",
    "nvim-tree/nvim-web-devicons", "natecraddock/workspaces.nvim",
    "ahmedkhalf/project.nvim", {
        "nvim-telescope/telescope.nvim",
        cmd = {"Telescope"},
        keys = {"<leader>ff"},
        dependencies = {
            "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim",
            "burntsushi/ripgrep", "sharkdp/fd",
            "ANGkeith/telescope-terraform-doc.nvim"
        }
    },

    {"nvim-tree/nvim-tree.lua", dependencies = {"nvim-tree/nvim-web-devicons"}},
    {"windwp/nvim-autopairs", event = "InsertEnter", opts = {}}, {
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        dependencies = {"nvim-tree/nvim-web-devicons", lazy = true}
    }, {"norcalli/nvim-colorizer.lua", event = "BufReadPre"},

    {"numToStr/Comment.nvim", lazy = true, keys = {"gc", "gcc"}},

    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}, {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline", "saadparwaiz1/cmp_luasnip",
            "f3fora/cmp-spell", "hrsh7th/cmp-calc", "hrsh7th/cmp-emoji"
        }
    }, {"rafamadriz/friendly-snippets", dependencies = {"L3MON4D3/LuaSnip"}}, {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles",
            "DiffviewFocusFiles"
        }
    }, {
        "TimUntersberger/neogit",
        dependencies = {"nvim-lua/plenary.nvim"},
        cmd = "Neogit"
    }, {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}, {
        "lewis6991/gitsigns.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        event = "BufReadPre"
    }, {"kevinhwang91/nvim-bqf", dependencies = {"junegunn/fzf"}}, {
        "akinsho/nvim-bufferline.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
        event = "BufReadPre"
    }, {"ray-x/lsp_signature.nvim", dependencies = {"neovim/nvim-lspconfig"}},

    {"onsails/lspkind-nvim", dependencies = {"famiu/bufdelete.nvim"}},

    {"lukas-reineke/indent-blankline.nvim", event = "BufReadPre"},

    {"akinsho/nvim-toggleterm.lua", keys = {"<C-y>", "<leader>fl"}}, {
        "ur4ltz/surround.nvim",
        config = function()
            require"surround".setup {mappings_style = "surround"}
        end
    }, {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        cmd = {"TroubleToggle", "Trouble"}
    }, {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = {"TodoTrouble", "TodoTelescope"},
        event = "BufReadPost"
    }, {"folke/which-key.nvim", branch = "main", keys = {"<leader>"}}, {
        "karb94/neoscroll.nvim",
        keys = {"<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-e>", "zt", "zz", "zb"}
    }, {"ThePrimeagen/harpoon", dependencies = {"nvim-lua/plenary.nvim"}},

    {"marko-cerovac/material.nvim"}, {"sidebar-nvim/sidebar.nvim"}, {
        "IndianBoy42/tree-sitter-just",
        config = function()
            require"tree-sitter-just".setup {}
        end
    }, {"simrat39/symbols-outline.nvim", cmd = {"SymbolsOutline"}}, {
        "ggandor/leap.nvim",
        config = function()
            require"leap".setup {}
        end
    }
}
