-- Keymaps for bettem default experiemce
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

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

-- Undo that makes sense
vim.keymap.set('n', 'U', '<C-r>', { noremap = true })

-- Keep this at all cost
vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<leader>hh', function()
  vim.lsp.inlay_hint.enable(vim.lsp.inlay_hint.is_enabled())
end)
