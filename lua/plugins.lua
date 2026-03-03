----------------------------------------------------------------------------------------
-- LAZY
----------------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- Leader Mapping (Required by Lazy)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

----------------------------------------------------------------------------------------
-- PLUGINS
----------------------------------------------------------------------------------------
local plugins = {
    'stevearc/conform.nvim',
    'stevearc/oil.nvim',
    'folke/neodev.nvim',
    'windwp/nvim-ts-autotag',
    'folke/which-key.nvim',
    'norcalli/nvim-colorizer.lua',
    'tpope/vim-fugitive',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'windwp/nvim-autopairs',
    'williamboman/mason.nvim',
    'L3MON4D3/LuaSnip',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'folke/zen-mode.nvim',
    'seblyng/roslyn.nvim',
    {
        'mrcjkb/rustaceanvim',
        event = "VeryLazy"
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true
    },
    {
        'tpope/vim-commentary',
        event = "VeryLazy"
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'sainnhe/sonokai',
        lazy = true
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
    },
    {
        "hrsh7th/nvim-cmp",
        event = 'VeryLazy',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { 'BufRead', 'BufNewFile' },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        build = ":TSUpdate",
        config = function()
            require("plugins.treesitter")
        end,
    },
}

-- Lazy Initialize
require("lazy").setup(plugins, {})

-- Autotag
require('nvim-ts-autotag').setup()

-- Lualine setup
require('lualine').setup {
    options = {
        theme = 'sonokai'
    }
}

-- Mason
require("mason").setup()
