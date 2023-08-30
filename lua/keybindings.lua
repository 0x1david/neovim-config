----------------------------------------------------------
-- Map Function 
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Neovim 
-----------------------------------------------------------
-- Leader
vim.api.nvim_set_keymap('', '<Leader>nn', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })


-- Movement in Insert Mode
map('i', '<C-k>', '<up>')
map('i', '<C-j>', '<down>')
map('i', '<C-h>', '<left>')
map('i', '<C-l>', '<right>')

-- Movement in Normal Mode
map("", "<S-e>", "<End>") -- Jump to the end of Line
map("", "a", "^") -- Jump to the beginning of a line

-- Text Editing
map("", "r", "<C-r>") -- Redo Changes
map("", "<S-q><S-l>", "d$") -- Delete to end of line
map("", "<S-q>l", "d$")
map("", "<S-q><S-h>", "d0") -- Delete to start of line
map("", "<S-q>h", "d0")

-- Unbind Arrow Keys
map("i", "<up>", "<nop>")
map("i", "<down>", "<nop>")
map("i", "<left>", "<nop>")
map("i", "<right>", "<nop>")

map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

