return {
	{
		"mhartington/formatter.nvim",
		event = { "BufWritePost" },
		init = function()
			-- autocmd BufWritePre * undojoin | FormatWrite
			-- autocmd for terraform is in ../../ftplugin/tf.lua
			vim.api.nvim_exec(
				[[
                augroup FormatAutogroup
                  autocmd!
                  autocmd BufWritePost *.md,*.lua,*.go,*.py,*.json,*.tf FormatWrite
                augroup END
                ]],
				true
			)
		end,
		config = function()
			local util = require("formatter.util")
			require("formatter").setup({
				filetype = {
					lua = {
						-- "formatter.filetypes.lua" defines default configurations for the
						-- "lua" filetype
						require("formatter.filetypes.lua").stylua,

						-- You can also define your own configuration
						function()
							-- Supports conditional formatting
							if util.get_current_buffer_file_name() == "special.lua" then
								return nil
							end

							-- Full specification of configurations is down below and in Vim help
							-- files
							return {
								exe = "stylua",
								args = {
									"--search-parent-directories",
									"--stdin-filepath",
									util.escape_path(util.get_current_buffer_file_path()),
									"--",
									"-",
								},
								stdin = true,
							}
						end,
					},
					go = {
						function()
							return {
								exe = "gofmt",
								args = {
									"-w",
									vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
								},
								stdin = false,
							}
						end,
					},
					json = {
						function()
							return {
								exe = "prettier",
								args = {
									"--stdin-filepath",
									"--tab-width 4",
									vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
								},
								stdin = true,
							}
						end,
					},
					markdown = {
						function()
							return {
								exe = "prettier",
								args = {
									"--stdin-filepath",
									vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
								},
								stdin = true,
							}
						end,
					},
					python = {
						function()
							return { exe = "black", args = { "-" }, stdin = true }
						end,
					},
					tf = {
						function()
							return {
								exe = "terraform",
								args = { "fmt", "-" },
								stdin = true,
							}
						end,
					},
					yaml = {
						function()
							return {
								-- exe = "yamlfix",
								-- args = {vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
								exe = "prettier",
								args = {
									"--single-quote",
									"false",
									"--parser",
									"yaml",
								},
								stdin = true,
							}
						end,
					},
				},
			})
		end,
	},
}
