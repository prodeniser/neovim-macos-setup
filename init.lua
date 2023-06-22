-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- LEADER
-- These keybindings need to be defined before the first / is called; otherwise, it will default to "\"
vim.g.mapleader = ";"
vim.g.localleader = ";"

-- IMPORTS
require('vars') -- Variables
require('opts') -- Options
require('keys') -- Keymaps
require('plug') -- Plugins

-- Plugin Imports
require('nvim-tree').setup{}
require('lualine').setup{
  -- set to use dracula theme like the rest of the editor
  options = {
    theme = 'dracula-nvim'
  }
}
-- make sure that telescope starts in normal mode
require('telescope').setup{
  defaults = {
    initial_mode = 'normal'
  }
}

-- implement surround commands
require('nvim-surround').setup()

-- indentation highlighting and context
require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true, -- highlights current conext
  --show_current_context_start = true, -- underlines context start
}

require('Comment').setup()
require('nvim-autopairs').setup()
