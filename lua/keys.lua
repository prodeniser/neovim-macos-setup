local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

-- Disable arrow keys
key_mapper('', '<up>', '<nop>')
key_mapper('', '<down>', '<nop>')
key_mapper('', '<left>', '<nop>')
key_mapper('', '<right>', '<nop>')

-- trigger window commands with leader instead of ctrl w
key_mapper('n', '<leader>w', '<C-w>')

-- Get escape to put you in normal mode in the terminal
key_mapper('t', '<Esc>', '<C-\\><C-n>')

-- Toggle nvim-tree
key_mapper('n', '<leader>n', [[:NvimTreeToggle]], {})

-- Fuzzy Finding w/ Telescope
local built_in = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', built_in.find_files, {})
vim.keymap.set('n', '<leader>fg', built_in.live_grep, {})
vim.keymap.set('n', '<leader>fb', built_in.buffers, {})
vim.keymap.set('n', '<leader>fh', built_in.help_tags, {})

key_mapper('n', '<C-n>t', [[:FloatermToggle]])
key_mapper('n', '<C-n>n', [[:FloatermNew]])
key_mapper('n', '<C-n>x', [[:FloatermKill]])
key_mapper('n', '<C-n>x!', [[:FloatermKill!]])
key_mapper('t', '<C-n>j', [[:FloatermNext]])
key_mapper('t', '<C-n>k', [[:FloatermPrev]])
