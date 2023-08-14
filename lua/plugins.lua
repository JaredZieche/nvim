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
return {
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
    }, {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}, {
        "f-person/git-blame.nvim",
        config = function()
            local g = vim.g
            g.gitblame_enabled = 0
        end
    }, "p00f/nvim-ts-rainbow",
    {"kevinhwang91/nvim-bqf", dependencies = {{"junegunn/fzf"}}},
    "famiu/bufdelete.nvim", {
        "ur4ltz/surround.nvim",
        config = function()
            require"surround".setup {mappings_style = "surround"}
        end
    }, "nvim-tree/nvim-web-devicons", "junegunn/vim-easy-align",
    "rhysd/vim-grammarous",
    {"ThePrimeagen/harpoon", dependencies = {"nvim-lua/plenary.nvim"}},
    {"tweekmonster/startuptime.vim"}, {
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
