return {
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      vim.g.loaded_netrw = 0
      vim.g.loaded_netrwPlugin = 0
      vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeFindFileToggle)

      require('nvim-tree').setup {
        sort_by = 'case_sensitive',
        view = {
          adaptive_size = true,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      }
    end,
  },
}
