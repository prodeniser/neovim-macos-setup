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
  options = {
    icons_enabled = true,
    -- set to use dracula theme like the rest of the editor
    theme = 'dracula-nvim',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = { {'filename', path = 2} },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {'filename', path =2} },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
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

-- dim windows that are not active
require('shade').setup{
  overlay_opacity = 65,
  -- opacity_step = 1,
  -- keys = {
  --   brightness_up    = '<C-Up>',
  --   brightness_down  = '<C-Down>',
  --   toggle           = '<Leader>s',
  -- }
}
