return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local g = vim.g
			local function on_attach(bufnr)
				local api = require("nvim-tree.api")
				local function opts(desc)
					return {
						desc = "nvim-tree: " .. desc,
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
					}
				end

				-- Default mappings not inserted as:
				--  remove_keymaps = true
				--  OR
				--  view.mappings.custom_only = true

				-- Mappings migrated from view.mappings.list
				--
				-- You will need to insert "your code goes here" for any mappings with a custom action_cb
				vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open: Edit File"))
				vim.keymap.set("n", "o", api.node.open.tab, opts("Open: New Tab"))
				vim.keymap.set("n", "<2-LeftMouse>", api.node.open.tab, opts("Open: New Tab"))
				vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
				vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
				vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
				vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
				vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
				vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
				vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
				vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
				vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
				vim.keymap.set("n", "<S-CR>", api.node.navigate.parent_close, opts("Close Directory"))
				vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
				vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
				vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
				vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
				vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
				vim.keymap.set("n", "a", api.fs.create, opts("Create"))
				vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
				vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
				vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
				vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
				vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
				vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
				vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
				vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
				vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
				vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
				vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
				vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
				vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
				vim.keymap.set("n", "q", api.tree.close, opts("Close"))
				vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
			end

			require("nvim-tree").setup({
				create_in_closed_folder = false,
				reload_on_bufenter = false,
				respect_buf_cwd = true,
				renderer = {
					add_trailing = false,
					group_empty = false,
					highlight_git = false,
					full_name = false,
					highlight_opened_files = "none",
					root_folder_modifier = ":~",
					indent_markers = {
						enable = false,
						icons = {
							corner = "└ ",
							edge = "│ ",
							item = "│ ",
							none = "  ",
						},
					},
					icons = {
						webdev_colors = true,
						git_placement = "before",
						padding = " ",
						symlink_arrow = " ➛ ",
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
						glyphs = {
							default = "",
							symlink = "",
							folder = {
								arrow_closed = "",
								arrow_open = "",
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "◌",
							},
						},
					},
					special_files = {
						"Cargo.toml",
						"Makefile",
						"README.md",
						"readme.md",
					},
				},
				auto_reload_on_write = true,
				-- disables netrw completely
				disable_netrw = true,
				-- hijack netrw window on startup
				hijack_netrw = true,
				-- hijack the cursor in the tree to put it at the start of the filename
				hijack_cursor = true,
				-- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
				update_cwd = true,
				-- show lsp diagnostics in the signcolumn
				diagnostics = {
					enable = true,
					show_on_dirs = false,
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				hijack_unnamed_buffer_when_opening = false,
				open_on_tab = false,
				sort_by = "name",
				-- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
				update_focused_file = {
					-- enables the feature
					enable = true,
					-- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
					-- only relevant when `update_focused_file.enable` is true
					update_cwd = true,
					-- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
					-- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
					ignore_list = { ".git", "node_modules", ".cache" },
				},
				-- configuration options for the system open command (`s` in the tree by default)
				system_open = {
					-- the command to run this, leaving nil should work in most cases
					cmd = nil,
					-- the command arguments as a list
					args = {},
				},

				on_attach = on_attach,
				view = {
					adaptive_size = false,
					centralize_selection = false,
					hide_root_folder = false,
					preserve_window_proportions = false,
					number = false,
					relativenumber = false,
					signcolumn = "yes",
					-- width of the window, can be either a number (columns) or a string in `%`
					width = 30,
					-- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
					side = "left",
				},
				hijack_directories = { enable = true, auto_open = true },
				filters = { dotfiles = false, custom = {}, exclude = {} },
				git = { enable = true, ignore = true, timeout = 400 },
				actions = {
					use_system_clipboard = true,
					change_dir = { enable = true, global = false },
					open_file = {
						quit_on_open = true,
						resize_window = false,
						window_picker = {
							enable = true,
							chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
							exclude = {
								filetype = {
									"notify",
									"packer",
									"qf",
									"diff",
									"fugitive",
									"fugitiveblame",
								},
								buftype = { "nofile", "terminal", "help" },
							},
						},
					},
				},
				trash = { cmd = "trash", require_confirm = true },
				log = {
					enable = false,
					truncate = false,
					types = {
						all = false,
						config = false,
						copy_paste = false,
						diagnostics = false,
						git = false,
						profile = false,
					},
				},
			})
		end,
	},
}
