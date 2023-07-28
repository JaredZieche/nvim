return {
  {"junegunn/vim-easy-align"},
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      enable_check_bracket_line = false,
      check_ts = true,
      ts_config = {
          lua = {"string"}, -- it will not add pair on that treesitter node
          javascript = {"template_string"},
          java = false -- don't check treesitter on java
      }
    }
  },
  {
      "ur4ltz/surround.nvim",
      config = function()
          require"surround".setup {mappings_style = "surround"}
      end
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    keys = {"gc", "gcc"},
    opts = {
      ---Add a space b/w comment and the line
      ---@type boolean
      padding = true,

      ---Lines to be ignored while comment/uncomment.
      ---Could be a regex string or a function that returns a regex string.
      ---Example: Use '^$' to ignore empty lines
      ---@type string|function
      ignore = '^$',

      ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
      ---@type table
      mappings = {
          ---operator-pending mapping
          ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
          basic = true,
          ---extra mapping
          ---Includes `gco`, `gcO`, `gcA`
          extra = true,
          ---extended mapping
          ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
          extended = true,
      },

      ---LHS of toggle mapping in NORMAL + VISUAL mode
      ---@type table
      toggler = {
          ---line-comment keymap
          line = 'gcc',
          ---block-comment keymap
          block = 'gbc',
      },

      ---LHS of operator-pending mapping in NORMAL + VISUAL mode
      ---@type table
      opleader = {
          ---line-comment keymap
          line = 'gc',
          ---block-comment keymap
          block = 'gb',
      },

      ---Pre-hook, called before commenting the line
      ---@type function|nil
      pre_hook = nil,

      ---Post-hook, called after commenting is done
      ---@type function|nil
      post_hook = nil,
    }
  },
  {
    "rafamadriz/friendly-snippets",
    dependencies = {"L3MON4D3/LuaSnip"}
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {"rafamadriz/friendly-snippets" },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },
  {
      "folke/trouble.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      cmd = {"TroubleToggle", "Trouble"}
  },
  {
      "folke/todo-comments.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      cmd = {"TodoTrouble", "TodoTelescope"},
      event = "BufReadPost"
  },
  {"norcalli/nvim-colorizer.lua", event = "BufReadPre"}
}
