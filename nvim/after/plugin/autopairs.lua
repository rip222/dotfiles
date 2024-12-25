-- Enable autopairs
local status, mod = pcall(require, 'nvim-autopairs');
if not status then 
  return
end
mod.setup()
