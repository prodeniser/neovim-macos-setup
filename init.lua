-- LEADER
-- These keybindings need to be defined before the first / is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

-- IMPORTS
-- Variables
require('vars')

-- Options
require('opts')

-- Keymaps
require('keys')

-- Plugins
-- require('plug')
