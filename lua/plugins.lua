local execute = vim.api.nvim_command
local fn = vim.fn
vim.g.mapleader = " "
return {
    "nvim-treesitter/nvim-treesitter-textobjects", "numToStr/Navigator.nvim",
    "famiu/bufdelete.nvim", "neovim/nvim-lspconfig", "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim", "saadparwaiz1/cmp_luasnip",
    "mhartington/formatter.nvim", "tweekmonster/startuptime.vim",
    "glepnir/dashboard-nvim", "p00f/nvim-ts-rainbow", "junegunn/vim-easy-align",
    "rhysd/vim-grammarous", "natecraddock/workspaces.nvim",
    {"norcalli/nvim-colorizer.lua", event = "BufReadPre"},

    {"numToStr/Comment.nvim", lazy = true, keys = {"gc", "gcc"}},

    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    {"kevinhwang91/nvim-bqf", dependencies = {"junegunn/fzf"}}, {
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

    {"sidebar-nvim/sidebar.nvim"}, {
        "IndianBoy42/tree-sitter-just",
        config = function()
            require"tree-sitter-just".setup {}
        end
    }, {
        "ggandor/leap.nvim",
        config = function()
            require"leap".setup {}
        end
    }
}
