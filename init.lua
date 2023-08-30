if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
end

-- Config
require("plugins")
require("keybindings")
require("lsp")

-- Plugin configs
require("plugins.treesitter")
require("plugins.cmp")
require("plugins.telescope")
require("plugins.gitsigns")
require("plugins.autopairs")

-- Indent Size
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

-- Relative Numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Mouse Mode
vim.o.mouse ='a'

-- Yank to System Clipboard
vim.opt.clipboard = "unnamedplus"

-- Save Undo History
vim.opt.undofile = true

-- Case Insensitive Searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Color Scheme
vim.opt.termguicolors = true
vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_better_performance = 1 
vim.cmd("colorscheme sonokai")
