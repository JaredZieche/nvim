-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/jaredzieche/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/jaredzieche/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/jaredzieche/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/jaredzieche/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/jaredzieche/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { 'require("config/comment")' },
    keys = { { "", "gc" }, { "", "gcc" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["Navigator.nvim"] = {
    config = { 'require("config/navigator")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/Navigator.nvim",
    url = "https://github.com/numToStr/Navigator.nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = { 'require("config/diffview")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["doom-one.nvim"] = {
    config = { 'require("config/doom-one")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/doom-one.nvim",
    url = "https://github.com/NTBBloodbath/doom-one.nvim"
  },
  ["formatter.nvim"] = {
    config = { 'require("config/formatter")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["git-blame.nvim"] = {
    config = { 'require("config/git-blame")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { 'require("config/gitsigns")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["hop.nvim"] = {
    config = { 'require("config/hop")' },
    keys = { { "", "<leader>j" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { 'require("config/indent-blankline")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lf.vim"] = {
    commands = { "<leader>fl" },
    config = { 'require("config/lf")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/lf.vim",
    url = "https://github.com/ptzz/lf.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("config/lualine")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["material.nvim"] = {
    config = { 'require("config/material")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { 'require("config/neogit")' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["neoscroll.nvim"] = {
    config = { 'require("config/neoscroll")' },
    keys = { { "", "<C-u>" }, { "", "<C-d>" }, { "", "<C-b>" }, { "", "<C-f>" }, { "", "<C-e>" }, { "", "zt" }, { "", "zz" }, { "", "zb" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("config/autopairs")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-bufferline.lua"] = {
    config = { 'require("config/bufferline")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    config = { 'require("config/cmp")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { 'require("config/colorizer")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    config = { 'require("config/lsp")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { 'require("config/lsp")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    config = { 'require("config/toggleterm")' },
    keys = { { "", "<C-y>" }, { "", "<leader>fl" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua",
    url = "https://github.com/akinsho/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    config = { 'require("config/nvim-tree")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require("config/treesitter")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { 'require("config/octo")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["presenting.vim"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/presenting.vim",
    url = "https://github.com/sotte/presenting.vim"
  },
  ["project.nvim"] = {
    config = { 'require("config/project")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["starlite-nvim"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/starlite-nvim",
    url = "https://github.com/ironhouzi/starlite-nvim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/startuptime.vim",
    url = "https://github.com/tweekmonster/startuptime.vim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\nh\0\0\3\0\6\0\v6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\3\0B\0\2\0029\0\5\0004\2\0\0B\0\2\1K\0\1\0\nsetup\frequire\rsurround\28surround_mappings_style\6g\bvim\0" },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/surround.nvim",
    url = "https://github.com/blackCauldron7/surround.nvim"
  },
  ["symbols-outline.nvim"] = {
    commands = { "SymbolsOutline" },
    config = { 'require("config/symbols")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { 'require("config/telescope")' },
    keys = { { "", "<leader>ff" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    commands = { "TodoTrouble", "TodoTelescope" },
    config = { 'require("config/todo")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle", "Trouble" },
    config = { 'require("config/trouble")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/junegunn/vim-easy-align"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-grammarous"] = {
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/vim-grammarous",
    url = "https://github.com/rhysd/vim-grammarous"
  },
  ["vim-illuminate"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-vsnip"] = {
    config = { 'require("config/vsnip")' },
    loaded = true,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["which-key.nvim"] = {
    config = { 'require("config/which")' },
    keys = { { "", "<leader>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/jaredzieche/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/zeertzjq/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
require("config/lsp")
time([[Config for nvim-lsp-installer]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("config/autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
require("config/project")
time([[Config for project.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require("config/lsp")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("config/treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
require("config/octo")
time([[Config for octo.nvim]], false)
-- Config for: doom-one.nvim
time([[Config for doom-one.nvim]], true)
require("config/doom-one")
time([[Config for doom-one.nvim]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
require("config/navigator")
time([[Config for Navigator.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require("config/nvim-tree")
time([[Config for nvim-tree.lua]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
require("config/formatter")
time([[Config for formatter.nvim]], false)
-- Config for: surround.nvim
time([[Config for surround.nvim]], true)
try_loadstring("\27LJ\2\nh\0\0\3\0\6\0\v6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\3\0B\0\2\0029\0\5\0004\2\0\0B\0\2\1K\0\1\0\nsetup\frequire\rsurround\28surround_mappings_style\6g\bvim\0", "config", "surround.nvim")
time([[Config for surround.nvim]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
require("config/vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: git-blame.nvim
time([[Config for git-blame.nvim]], true)
require("config/git-blame")
time([[Config for git-blame.nvim]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
require("config/material")
time([[Config for material.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("config/cmp")
time([[Config for nvim-cmp]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TodoTelescope lua require("packer.load")({'todo-comments.nvim'}, { cmd = "TodoTelescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewClose lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TodoTrouble lua require("packer.load")({'todo-comments.nvim'}, { cmd = "TodoTrouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewToggleFiles lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewToggleFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewFocusFiles lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewFocusFiles", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined <leader>fl ++once lua require"packer.load"({'lf.vim'}, {}, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> zb <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "zb", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>fl <cmd>lua require("packer.load")({'nvim-toggleterm.lua'}, { keys = "<lt>leader>fl", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-u> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-u>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> zt <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "zt", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-e> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-e>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> zz <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "zz", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>j <cmd>lua require("packer.load")({'hop.nvim'}, { keys = "<lt>leader>j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-d> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-d>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>ff <cmd>lua require("packer.load")({'telescope.nvim'}, { keys = "<lt>leader>ff", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-f> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-f>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gcc <cmd>lua require("packer.load")({'Comment.nvim'}, { keys = "gcc", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-b> <cmd>lua require("packer.load")({'neoscroll.nvim'}, { keys = "<lt>C-b>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-y> <cmd>lua require("packer.load")({'nvim-toggleterm.lua'}, { keys = "<lt>C-y>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'lualine.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'vim-illuminate'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-colorizer.lua', 'nvim-bufferline.lua', 'gitsigns.nvim', 'indent-blankline.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'todo-comments.nvim'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
