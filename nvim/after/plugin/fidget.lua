-- Turn on lsp status information
local status, mod = pcall(require, 'fidget');
if not status then
  return;
end
mod.setup()
