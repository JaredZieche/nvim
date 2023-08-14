local execute = vim.api.nvim_command
local fn = vim.fn

-- local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
    return string.format("require(\"config/%s\")", name)
end

-- -- bootstrap packer if not installed
-- if fn.empty(fn.glob(install_path)) > 0 then
--     fn.system({
--         "git", "clone", "https://github.com/wbthomason/packer.nvim",
--         install_path
--     })
--     execute "packadd packer.nvim"
-- end

-- -- initialize and configure packer
-- local packer = require("packer")
-- packer.init {
--     enable = true, -- enable profiling via :PackerCompile profile=true
--     threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
-- }
-- local use = packer.use
-- packer.reset()

-- actual plugins list
require("lazy").setup({
    {
        "rest-nvim/rest.nvim",
        cmd = {"RestNvim", "RestNvimPreview", "RestNvimLast"},
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("rest-nvim").setup({
                -- Open request results in a horizontal split
                result_split_horizontal = false,
                -- Keep the http file buffer above|left when split horizontal|vertical
                result_split_in_place = false,
                -- Skip SSL verification, useful for unknown certificates
                skip_ssl_verification = false,
                -- Encode URL before making request
                encode_url = true,
                -- Highlight request on run
                highlight = {enabled = true, timeout = 150},
                result = {
                    -- toggle showing URL, HTTP info, headers at top the of result window
                    show_url = true,
                    -- show the generated curl command in case you want to launch
                    -- the same request via the terminal (can be verbose)
                    show_curl_command = false,
                    show_http_info = true,
                    show_headers = true,
                    -- executables or functions for formatting response body [optional]
                    -- set them to false if you want to disable them
                    formatters = {json = "jq", html = false}
                },
                -- Jump to request line on run
                jump_to_request = false,
                env_file = ".env",
                custom_dynamic_variables = {},
                yank_dry_run = true
            })
        end
    }, {
        "nvim-telescope/telescope.nvim",
        cmd = {"Telescope"},
        keys = {"<leader>ff"},
        dependencies = {
            {"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"},
            {"burntsushi/ripgrep"}, {"sharkdp/fd"},
            {"ANGkeith/telescope-terraform-doc.nvim"}
        },
        config = get_config("telescope")
    }, {
        "nvim-tree/nvim-tree.lua",
        config = get_config("nvim-tree"),
        dependencies = {"nvim-tree/nvim-web-devicons"}
    }, {"numToStr/Navigator.nvim", config = get_config("navigator")}, {
        "nvim-lualine/lualine.nvim",
        config = get_config("lualine"),
        event = "VimEnter",
        dependencies = {"nvim-tree/nvim-web-devicons", lazy = true}
    }, {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPre",
        config = get_config("colorizer")
    }, {
        "numToStr/Comment.nvim",
        lazy = true,
        keys = {"gc", "gcc"},
        config = get_config("comment")
    }, {"windwp/nvim-autopairs", config = get_config("autopairs")}, {
        "nvim-treesitter/nvim-treesitter",
        config = get_config("treesitter"),
        build = ":TSUpdate"
    }, "nvim-treesitter/nvim-treesitter-textobjects", {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-cmdline"},
            {"saadparwaiz1/cmp_luasnip"},
            {"f3fora/cmp-spell", {"hrsh7th/cmp-calc"}, {"hrsh7th/cmp-emoji"}}
        },
        config = get_config("cmp")
    }, {"L3MON4D3/LuaSnip", config = get_config("luasnip")},

    {"saadparwaiz1/cmp_luasnip"},

    {"rafamadriz/friendly-snippets", dependencies = {{"L3MON4D3/LuaSnip"}}},

    {"mhartington/formatter.nvim", config = get_config("formatter")},

    -- requirement for Neogit
    {
        "sindrets/diffview.nvim",
        cmd = {
            "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles",
            "DiffviewFocusFiles"
        },
        config = get_config("diffview")
    }, {
        "NeogitOrg/neogit",
        dependencies = {"nvim-lua/plenary.nvim"},
        cmd = "Neogit",
        config = get_config("neogit")
    }, {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},

    {"f-person/git-blame.nvim", config = get_config("git-blame")}, {
        "lewis6991/gitsigns.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        event = "BufReadPre",
        config = get_config("gitsigns")
    }, "p00f/nvim-ts-rainbow",

    {"kevinhwang91/nvim-bqf", dependencies = {{"junegunn/fzf"}}}, {
        "akinsho/nvim-bufferline.lua",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        event = "BufReadPre",
        config = get_config("bufferline")
    }, "famiu/bufdelete.nvim",

    {"neovim/nvim-lspconfig", config = get_config("lsp")},

    {"williamboman/mason.nvim", config = get_config("lsp")},

    {"williamboman/mason-lspconfig.nvim", config = get_config("lsp")},

    {"ray-x/lsp_signature.nvim", dependencies = {{"neovim/nvim-lspconfig"}}},

    {"onsails/lspkind-nvim", dependencies = {{"famiu/bufdelete.nvim"}}}, {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
        config = get_config("indent-blankline")
    }, {
        "akinsho/nvim-toggleterm.lua",
        version = "*",
        keys = {"<C-y>", "<leader>fl"},
        config = get_config("toggleterm")
    }, {
        "ur4ltz/surround.nvim",
        config = function()
            require"surround".setup {mappings_style = "surround"}
        end
    }, "nvim-tree/nvim-web-devicons", {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        cmd = {"TroubleToggle", "Trouble"},
        config = get_config("trouble")
    }, {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = {"TodoTrouble", "TodoTelescope"},
        event = "BufReadPost",
        config = get_config("todo")
    },
    "junegunn/vim-easy-align", "rhysd/vim-grammarous", {
        "karb94/neoscroll.nvim",
        keys = {"<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-e>", "zt", "zz", "zb"},
        config = get_config("neoscroll")
    }, {"ThePrimeagen/harpoon", dependencies = {"nvim-lua/plenary.nvim"}},

    {"tweekmonster/startuptime.vim"},

    {"sidebar-nvim/sidebar.nvim", version = "*", config = get_config("sidebar")},

    {"natecraddock/workspaces.nvim", config = get_config("workspaces")}, {
        "IndianBoy42/tree-sitter-just",
        config = function()
            require"tree-sitter-just".setup {}
        end
    }, {"glepnir/dashboard-nvim", config = get_config("dashboard")},

    {"stevearc/aerial.nvim", config = get_config("symbols")}, -- {
    --   "simrat39/symbols-outline.nvim",
    --   cmd = { "SymbolsOutline" },
    --   config = get_config("symbols")
    -- }
    {
        "ggandor/leap.nvim",
        config = function()
            require"leap".setup {}
        end
    }
})


-- TODO: ????
-- https://github.com/glepnir/lspsaga.nvim
-- use 'glepnir/lspsaga.nvim'
-- Too intrusive (fFtT, sS zZ, xX ...)
-- https://github.com/ggandor/lightspeed.nvim
-- use 'ggandor/lightspeed.nvim'
