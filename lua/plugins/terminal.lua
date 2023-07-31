return {
  {
    "akinsho/nvim-toggleterm.lua",
    keys = { "<C-y>", "<leader>fl" },
    version = "*",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      hide_numbers = true,
      open_mapping = [[<c-y>]],
      direction = "vertical",
      start_in_insert = true,
      shade_terminals = true,
      shade_factor = "-30",
      persist_size = false,
      winbar = {
        enabled = true,
        name_formatter = function(term)
          return term.name
        end
      }
    },
  }
}
