-- Set lualine as statusline
-- See `:help lualine.txt`
local status, mod = pcall(require, 'lualine')
if not status then
  return
end
mod.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}
