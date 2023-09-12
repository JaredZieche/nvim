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
		event = "VeryLazy",
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
	{ "fazibear/cmp-nerdfonts", event = "VeryLazy", config = true },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "kevinhwang91/nvim-bqf", dependencies = { { "junegunn/fzf" } } },
	{ "famiu/bufdelete.nvim", event = "VeryLazy" },
	{
		"ur4ltz/surround.nvim",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("surround").setup({ mappings_style = "surround" })
		end,
	},
	{ "tweekmonster/startuptime.vim" },
	"p00f/nvim-ts-rainbow",
	"nvim-tree/nvim-web-devicons",
	"junegunn/vim-easy-align",
	"rhysd/vim-grammarous",
}
