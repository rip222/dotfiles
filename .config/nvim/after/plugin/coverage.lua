local status, mod = pcall(require, 'coverage')
if not status then
  return
end
mod.setup()
