local execute = vim.api.nvim_command
local fn = vim.fn

return {
	{
		"glepnir/nerdicons.nvim",
		cmd = "NerdIcons",
		config = function()
			require("nerdicons").setup({})
		end,
	},
	{
		"rest-nvim/rest.nvim",
		cmd = { "RestNvim", "RestNvimPreview", "RestNvimLast" },
		dependencies = { "nvim-lua/plenary.nvim" },
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
				highlight = { enabled = true, timeout = 150 },
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
					formatters = { json = "jq", html = false },
				},
				-- Jump to request line on run
				jump_to_request = false,
				env_file = ".env",
				custom_dynamic_variables = {},
				yank_dry_run = true,
			})
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"f-person/git-blame.nvim",
		config = function()
			local g = vim.g
			g.gitblame_enabled = 0
		end,
	},
	"p00f/nvim-ts-rainbow",
	{ "kevinhwang91/nvim-bqf", dependencies = { { "junegunn/fzf" } } },
	"famiu/bufdelete.nvim",
	{
		"ur4ltz/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "surround" })
		end,
	},
	"nvim-tree/nvim-web-devicons",
	"junegunn/vim-easy-align",
	"rhysd/vim-grammarous",
	{ "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "tweekmonster/startuptime.vim" },
	{
		"IndianBoy42/tree-sitter-just",
		config = function()
			require("tree-sitter-just").setup({})
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").setup({})
		end,
	},
}
