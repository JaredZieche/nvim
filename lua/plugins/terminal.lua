return {
  {
    "akinsho/nvim-toggleterm.lua",
    keys = {"<C-y>", "<leader>fl"},
    opts = {
      open_mapping = [[<c-y>]],
      direction = "vertical", -- 'vertical' | 'horizontal' | 'window' | 'float',
      winbar = {
        enabled = true,
        name_formatter = function(term)
          return term.name
        end
      }
    },
    config = function ()
      local Terminal = require("toggleterm.terminal").Terminal
      local ghdash = Terminal:new({
          cmd = "gh dash",
          direction = "float",
          hidden = true
      })
      function _gh_dash()
        ghdash:toggle()
      end
      vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua _lazygit_toggle()<CR>i", {noremap = true, silent = true}) -- start lazygit
      vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", {noremap = true, silent = true}) -- back to normal mode in Terminal
    end
  }
}
