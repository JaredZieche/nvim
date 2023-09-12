return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			local home = os.getenv("HOME")
			require("dashboard").setup({
				theme = "doom",
				disable_move = true,
				shortcut_type = "letter",
				config = {
					center = {
						{
							icon = "  ",
							desc = "Workspaces",
							key = "w",
							keymap = "SPC s w",
							action = "Telescope workspaces",
						},
						{
							icon = "  ",
							desc = "Projects",
							key = "p",
							keymap = "SPC s p",
							action = "Telescope projects",
						},
						{
							icon = "  ",
							desc = "Recently opened files",
							action = "DashboardFindHistory",
							key = "r",
							keymap = "SPC f r",
						},
						{
							icon = "  ",
							desc = "Find  File                              ",
							action = "Telescope find_files",
							key = "f",
							keymap = "SPC f f",
						},
						{
							icon = "  ",
							desc = "File Tree                            ",
							action = "NvimTreeOpen",
							key = "t",
							keymap = "SPC f T",
						},
						{
							icon = "  ",
							desc = "Find  word                              ",
							action = "Telescope live_grep",
							key = "w",
							keymap = "SPC f w",
						},
						{
							icon = "  ",
							desc = "Open Personal dotfiles                  ",
							action = "Telescope dotfiles path=" .. home .. "/.dotfiles",
							key = "d",
							keymap = "SPC f d",
						},
					},
				},
				preview = {
					command = "cat | lolcat -F 0.3",
					file_path = home .. "/.config/nvim/static/neovim.cat",
					file_height = 12,
					file_width = 80,
				},
			})
		end,
	},
}
