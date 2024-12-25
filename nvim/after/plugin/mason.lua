-- Setup mason so it can manage external tooling
local status, mason = pcall(require, 'mason')
if not status then
  return
end

mason.setup()
