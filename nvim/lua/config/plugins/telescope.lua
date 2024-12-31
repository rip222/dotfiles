return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        defaults = {
          layout_strategy = 'horizontal', -- Set default layout to vertical
          layout_config = {
            horizontal = {
              width = 0.9, -- Optional: adjust the width of the vertical layout (default is 0.9)
              height = 0.8, -- Optional: adjust the height of the vertical layout (default is 0.8)
              preview_height = 0.6, -- Optional: adjust the preview window height (default is 0.5)
            },
          },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
        pickers = {
          find_files = {
            theme = 'ivy',
          },
          buffers = {
            theme = 'ivy',
          },
          diagnostics = {
            theme = 'ivy',
          },
          live_grep = {
            theme = 'ivy',
          },
        },
      }

      local builtin = require 'telescope.builtin'
      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer]' })

      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>st', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sn', function()
        local cwd = builtin.find_files {
          cwd = vim.fn.stdpath 'config',
        }
      end)
    end,
  },
}
