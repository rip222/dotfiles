-- VS code icons
local status, mod = pcall(require, 'nvim-web-devicons');
if not status then
  return;
end
mod.setup()
