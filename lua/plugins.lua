local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
    return string.format("require(\"config/%s\")", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git", "clone", "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    execute "packadd packer.nvim"
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()

-- actual plugins list
use "wbthomason/packer.nvim"

use {
    "nvim-telescope/telescope.nvim",
    cmd = {"Telescope"},
    keys = {"<leader>ff"},
    requires = {
        {"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"},
        {"burntsushi/ripgrep"}, {"sharkdp/fd"},
        {"ANGkeith/telescope-terraform-doc.nvim"}
    },
    config = get_config("telescope")
}

use {
    "nvim-tree/nvim-tree.lua",
    config = get_config("nvim-tree"),
    requires = {"nvim-tree/nvim-web-devicons"}
}

use {"numToStr/Navigator.nvim", config = get_config("navigator")}

use {
    "nvim-lualine/lualine.nvim",
    config = get_config("lualine"),
    event = "VimEnter",
    requires = {"nvim-tree/nvim-web-devicons", opt = true}
}

use {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = get_config("colorizer")
}

use {
    "numToStr/Comment.nvim",
    opt = true,
    keys = {"gc", "gcc"},
    config = get_config("comment")
}

use {"windwp/nvim-autopairs", config = get_config("autopairs")}

use {
    "nvim-treesitter/nvim-treesitter",
    config = get_config("treesitter"),
    run = ":TSUpdate"
}

use "nvim-treesitter/nvim-treesitter-textobjects"

use {
    "hrsh7th/nvim-cmp",
    requires = {
        {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-cmdline"}, {"saadparwaiz1/cmp_luasnip"},
        {"f3fora/cmp-spell", {"hrsh7th/cmp-calc"}, {"hrsh7th/cmp-emoji"}}
    },
    config = get_config("cmp")
}

use {"L3MON4D3/LuaSnip", config = get_config("luasnip")}

use {"saadparwaiz1/cmp_luasnip"}

use {"rafamadriz/friendly-snippets", requires = {{"L3MON4D3/LuaSnip"}}}

use {"mhartington/formatter.nvim", config = get_config("formatter")}

-- requirement for Neogit
use {
    "sindrets/diffview.nvim",
    cmd = {
        "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles",
        "DiffviewFocusFiles"
    },
    config = get_config("diffview")
}

use {
    "NeogitOrg/neogit",
    requires = {"nvim-lua/plenary.nvim"},
    cmd = "Neogit",
    config = get_config("neogit")
}

use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

use {"f-person/git-blame.nvim", config = get_config("git-blame")}

use {
    "lewis6991/gitsigns.nvim",
    requires = {"nvim-lua/plenary.nvim"},
    event = "BufReadPre",
    config = get_config("gitsigns")
}

use "p00f/nvim-ts-rainbow"

use {"kevinhwang91/nvim-bqf", requires = {{"junegunn/fzf"}}}

use {
    "akinsho/nvim-bufferline.lua",
    tag = "*",
    requires = "nvim-tree/nvim-web-devicons",
    event = "BufReadPre",
    config = get_config("bufferline")
}

use "famiu/bufdelete.nvim"

use {"neovim/nvim-lspconfig", config = get_config("lsp")}

use {"williamboman/mason.nvim", config = get_config("lsp")}

use {"williamboman/mason-lspconfig.nvim", config = get_config("lsp")}

use {"ray-x/lsp_signature.nvim", requires = {{"neovim/nvim-lspconfig"}}}

use {"onsails/lspkind-nvim", requires = {{"famiu/bufdelete.nvim"}}}

use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = [[require("config/indent-blankline")]]
}

use {
    "akinsho/nvim-toggleterm.lua",
    tag = "*",
    keys = {"<C-y>", "<leader>fl"},
    config = get_config("toggleterm")
}

use {
    "ur4ltz/surround.nvim",
    config = function()
        require"surround".setup {mappings_style = "surround"}
    end
}

use "nvim-tree/nvim-web-devicons"

use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    cmd = {"TroubleToggle", "Trouble"},
    config = get_config("trouble")
}

use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    cmd = {"TodoTrouble", "TodoTelescope"},
    event = "BufReadPost",
    config = get_config("todo")
}

use {"ahmedkhalf/project.nvim", config = get_config("project")}

use {
    "folke/which-key.nvim",
    branch = "main",
    keys = {"<leader>"},
    config = get_config("which")
}

use "junegunn/vim-easy-align" -- no lua alternative

use "rhysd/vim-grammarous"

use {
    "karb94/neoscroll.nvim",
    keys = {"<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-e>", "zt", "zz", "zb"},
    config = get_config("neoscroll")
}

use {"ThePrimeagen/harpoon", requires = {"nvim-lua/plenary.nvim"}}

use {"tweekmonster/startuptime.vim"}

use {"marko-cerovac/material.nvim", tag = "*", config = get_config("material")}

use {"sidebar-nvim/sidebar.nvim", tag = "*", config = get_config("sidebar")}

use {"natecraddock/workspaces.nvim", config = get_config("workspaces")}

use {
    "IndianBoy42/tree-sitter-just",
    config = function()
        require"tree-sitter-just".setup {}
    end
}

use {"glepnir/dashboard-nvim", config = get_config("dashboard")}

use {"stevearc/aerial.nvim", config = get_config("symbols")}

-- use {
--   "simrat39/symbols-outline.nvim",
--   cmd = { "SymbolsOutline" },
--   config = get_config("symbols")
-- }

use {
    "ggandor/leap.nvim",
    config = function()
        require"leap".setup {}
    end
}

-- TODO: ????
-- https://github.com/glepnir/lspsaga.nvim
-- use 'glepnir/lspsaga.nvim'
-- Too intrusive (fFtT, sS zZ, xX ...)
-- https://github.com/ggandor/lightspeed.nvim
-- use 'ggandor/lightspeed.nvim'
