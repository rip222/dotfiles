local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', tag = 'legacy', event = 'LspAttach' },
    },
  },
  -- 'jose-elias-alvarez/null-ls.nvim',
  'nvimtools/none-ls.nvim',

  'onsails/lspkind.nvim', -- vscode-like pictograms for neovim lsp completion items
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update({ with_sync = true }))
    end,
  },
  {
    -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter' },
  },

  'nvim-treesitter/playground',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',

  'ellisonleao/gruvbox.nvim', -- Lua port of the most famous vim colorscheme
  'navarasu/onedark.nvim', -- Theme inspired by Atom
  'nvim-lualine/lualine.nvim', -- Fancier statusline
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  'windwp/nvim-autopairs', -- Auto closing brackets etc

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable('make') == 1,
  },

  'BeastCode/VSCode-Angular-TypeScript-Snippets',
  {
    'Equilibris/nx.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('nx').setup({})
    end,
  },
  'rust-lang/rust.vim',
  'NvChad/nvim-colorizer.lua',

  { 'akinsho/toggleterm.nvim', version = '*' },
}

local options = {}
require('lazy').setup(plugins, options)
