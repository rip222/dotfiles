-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local status, mod = pcall(require, 'telescope')
if not status then
  return
end
mod.setup({
  defaults = {
    layout_config = {
      vertical = { width = 1 },
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
})

-- Enable telescope fzf native, if installed
pcall(mod.load_extension, 'fzf')
