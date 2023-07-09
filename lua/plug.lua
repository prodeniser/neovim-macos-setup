-- CONFIGURE PACKER
local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
  local use = use

  -- [[ PLUGINS ]]
  use { -- nvim-tree
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly'
  }
  use { 
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { 
      'nvim-lua/plenary.nvim',
    }
  }
  use {
    'kylechui/nvim-surround',
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  }
  use { 'numToStr/Comment.nvim'} -- Toggling commented lines
  use { 'windwp/nvim-autopairs'}
  use { 'tpope/vim-fugitive' } -- git plugin
  use { 'junegunn/gv.vim' } -- git plugin

  -- [[ Theme ]]
  use { 'mhinz/vim-startify' } -- startup menu
  use { 'DanilaMihailov/beacon.nvim' } -- highlight cursor on jump
  use { 'nvim-lualine/lualine.nvim' } -- status line theming
  use { 'Mofiqul/dracula.nvim' } -- colorscheme
  use { 'lukas-reineke/indent-blankline.nvim' } -- indentation and context highlighting
  use { 'sunjon/shade.nvim' } -- dim panel not in focus

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
end)
