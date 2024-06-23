-- Keymaps for bettem default experiemce
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Open Explorer (Nvim Tree)
local nvimtree_exists, _ = pcall(require, 'nvim-tree')

if nvimtree_exists then
  -- disable netrw. Nvim tree will be used isntead
  vim.g.loaded_netrw = 0
  vim.g.loaded_netrwPlugin = 0
  vim.keymap.set('n', '<leader>e', vim.cmd.NvimTreeFindFileToggle)
else
  vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
end

local opts = { noremap = true, silent = true }
-- Indent line(s)
vim.keymap.set('n', '<Tab>', '>>', opts)
vim.keymap.set('n', '<S-Tab>', '<<', opts)
vim.keymap.set('v', '<Tab>', '>gv', opts)
vim.keymap.set('v', '<S-Tab>', '<gv', opts)

vim.keymap.set('n', '<C-i>', '<C-i>', opts)

-- Move current line / block with Alt-j/k ala vscode.
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', opts)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', opts)
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv-gv", opts)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv-gv", opts)

-- Emulate arrow keys in edit mode
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('x', '<C-j>', '<Down>')
vim.keymap.set('x', '<C-k>', '<Up>')
vim.keymap.set('x', '<C-l>', '<Right>')
vim.keymap.set('x', '<C-h>', '<Left>')

-- Undo that makes sense
vim.keymap.set('n', 'U', '<C-r>', { noremap = true })

-- Keep this at all cost
vim.keymap.set('n', 'Q', '<nop>')

-- Make sure vim-gutitive is installed
if vim.cmd.Git then
  vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
end

vim.keymap.set('n', '<leader>gb', function()
  vim.cmd.Gitsigns 'blame_line'
end)

local telescope_installed, _ = pcall(require, 'telescope')
if telescope_installed then
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
end

vim.keymap.set('n', '<leader>nx', function()
  require('nx.generators').generators()
end, { desc = '[NX] generators' })

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
