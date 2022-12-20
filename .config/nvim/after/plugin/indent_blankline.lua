-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
local status, mod = pcall(require, 'indent_blankline')
if not status then
  return
end
mod.setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

