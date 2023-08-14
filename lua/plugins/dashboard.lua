return {
  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
        local home = os.getenv("HOME")
        require("dashboard").setup {
          preview_command = "cat | lolcat -F 0.3",
          preview_file_path = home .. "/.config/nvim/static/neovim.cat",
          preview_file_height = 12,
          preview_file_width = 80,
          custom_center = {
              {
                  icon = "  ",
                  desc = "Workspaces                              ",
                  shortcut = "SPC s w",
                  action = "Telescope workspaces"
              }, {
                  icon = "  ",
                  desc = "Projects                                ",
                  shortcut = "SPC s p",
                  action = "Telescope projects"
              }, {
                  icon = "  ",
                  desc = "Recently opened files                   ",
                  action = "DashboardFindHistory",
                  shortcut = "SPC f r"
              }, {
                  icon = "  ",
                  desc = "Find  File                              ",
                  action = "Telescope find_files find_command=rg,--hidden,--files",
                  shortcut = "SPC f f"
              }, {
                  icon = "  ",
                  desc = "File Browser                            ",
                  action = "Telescope file_browser",
                  shortcut = "SPC f f"
              }, {
                  icon = "  ",
                  desc = "Find  word                              ",
                  action = "Telescope live_grep",
                  shortcut = "SPC f w"
              }, {
                  icon = "  ",
                  desc = "Open Personal dotfiles                  ",
                  action = "Telescope dotfiles path=" .. home .. "/.dotfiles",
                  shortcut = "SPC f d"
              }
          }
      }
    end
  }
}
