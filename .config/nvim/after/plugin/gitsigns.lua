-- Gitsigns
-- See `:help gitsigns.txt`
local status, mod = pcall(require, 'gitsigns')
if not status then
  return
end
mod.setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

