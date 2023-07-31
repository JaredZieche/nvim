return {
  {
    "f-person/git-blame.nvim",
    lazy = true,
    config = function()
        vim.g.gitblame_enabled = 0
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    event = "BufReadPre",
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk)
        map('n', '<leader>hr', gs.reset_hunk)
        map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end,
    }
  },
  {
    "NeogitOrg/neogit",
    dependencies = {"nvim-lua/plenary.nvim"},
    cmd = "Neogit",
    opts = {
      disable_commit_confirmation = true,
      kind = "vsplit",
      integrations = {diffview = true, telescope = true},
      -- override/add mappings
    }
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles",
      "DiffviewFocusFiles"
    },
    config = function()
      local actions = require("diffview.actions")

      require("diffview").setup({
          enhanced_diff_hl = true
      })
    end
  }
}