----------------------------------------------------------------------------------------
-- LAZY 
---------------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
----------------------------------------------------------------------------------------
-- PLUGINS
----------------------------------------------------------------------------------------
local plugins = {
  'wbthomason/packer.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  { 'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim' }},
  "sainnhe/sonokai",
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }},
  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' }},
  'nvim-treesitter/nvim-treesitter-textobjects',
  'hrsh7th/cmp-nvim-lsp',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'echasnovski/mini.pairs',
 {
    "hrsh7th/nvim-cmp",
    -- event = 'InsertEnter',
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
  },
}

-- Mods

require("lazy").setup(plugins, {})
require('lualine').setup {
        options = {
        theme = 'sonokai'
          }
        }

