-- Treesitter

-- Textobjects
require('nvim-treesitter-textobjects').setup({
    select = {
        lookahead = true,
    },
    move = {
        set_jumps = true,
    },
})

local select_ts = require('nvim-treesitter-textobjects.select')
local move_ts = require('nvim-treesitter-textobjects.move')

-- Textobject select
local select_keymaps = {
    ['af'] = '@function.outer',
    ['if'] = '@function.inner',
    ['ac'] = '@class.outer',
    ['ic'] = '@class.inner',
}
for key, query in pairs(select_keymaps) do
    vim.keymap.set({ 'x', 'o' }, key, function()
        select_ts.select_textobject(query, 'textobjects')
    end)
end

-- Textobject move
vim.keymap.set({ 'n', 'x', 'o' }, ']m', function() move_ts.goto_next_start('@function.outer') end)
vim.keymap.set({ 'n', 'x', 'o' }, ']]', function() move_ts.goto_next_start('@class.outer') end)
vim.keymap.set({ 'n', 'x', 'o' }, ']M', function() move_ts.goto_next_end('@function.outer') end)
vim.keymap.set({ 'n', 'x', 'o' }, '][', function() move_ts.goto_next_end('@class.outer') end)
vim.keymap.set({ 'n', 'x', 'o' }, '[m', function() move_ts.goto_previous_start('@function.outer') end)
vim.keymap.set({ 'n', 'x', 'o' }, '[[', function() move_ts.goto_previous_start('@class.outer') end)
vim.keymap.set({ 'n', 'x', 'o' }, '[M', function() move_ts.goto_previous_end('@function.outer') end)
vim.keymap.set({ 'n', 'x', 'o' }, '[]', function() move_ts.goto_previous_end('@class.outer') end)
