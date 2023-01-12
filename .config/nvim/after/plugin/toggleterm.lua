local status, mod = pcall(require, 'toggleterm')
if not status then
  return
end

mod.setup({
  direction = 'float',
})
