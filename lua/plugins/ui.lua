return {
  {
    "akinsho/nvim-bufferline.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return "(" .. count .. ")"
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            highlight = "Directory",
            padding = 1
          }
        },
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        sort_by = "id"
      }
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
    config = function()
      require "lualine".setup {
        options = {
          icons_enabled = true,
          theme = "material-nvim",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {},
          globalstatus = true
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { "filename" },
          lualine_x = {
            { "diagnostics", sources = { "nvim_lsp" } }, "encoding",
            "fileformat", "filetype"
          },
          lualine_y = { "progress" },
          lualine_z = { "location" }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = { "nvim-tree", "toggleterm", "quickfix" },
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        }
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    opts = {
      indentLine_enabled = 1,
      char = "▏",
      filetype_exclude = {
        "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
        "packer", "vimwiki", "markdown", "json", "txt", "vista", "help",
        "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
        "flutterToolsOutline", "" -- for all buffers without a file type
      },
      buftype_exclude = { "terminal", "nofile" },
      show_trailing_blankline_indent = false,
      show_first_indent_level = true,
      show_current_context = true,
      char_list = { "|", "¦", "┆", "┊" },
      space_char = " ",
      context_patterns = {
        "class", "function", "method", "block", "list_literal", "selector",
        "^if", "^table", "if_statement", "while", "for"
      }
    }
  },
  { "p00f/nvim-ts-rainbow" },
  {
    "nvimdev/dashboard-nvim",
    event = 'VimEnter',
    config = function()
      local home = os.getenv('HOME')
      require('dashboard').setup {
        theme = 'doom',
        disable_move = true,
        shortcut_type = 'letter',
        config = {
          center = {
            { icon = '  ',
              desc = 'Workspaces',
              key = 'w',
              keymap = 'SPC s w',
              action = 'Telescope workspaces' },
            { icon = '  ',
              desc = 'Projects',
              key = 'p',
              keymap = 'SPC s p',
              action = 'Telescope projects' },
            { icon = '  ',
              desc = 'Recently opened files',
              action = 'DashboardFindHistory',
              key = 'f',
              keymap = 'SPC f r' },
            { icon = '  ',
              desc = 'Find  File                              ',
              action = 'Telescope find_files find_command=rg,--hidden,--files',
              keymap = 'SPC f f' },
            { icon = '  ',
              desc = 'File Browser                            ',
              action = 'Telescope file_browser',
              keymap = 'SPC f f' },
            { icon = '  ',
              desc = 'Find  word                              ',
              action = 'Telescope live_grep',
              keymap = 'SPC f w' },
            { icon = '  ',
              desc = 'Open Personal dotfiles                  ',
              action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
              keymap = 'SPC f d' },
          }
        },
        preview = {
          command     = 'cat | lolcat -F 0.3',
          file_path   = home .. '/.config/nvim/static/neovim.cat',
          file_height = 12,
          file_width  = 80,
        },
      }
    end,
  }
}
