local ok, wt = pcall(require, 'wezterm')
if not ok then
  return
end

return {
  color_scheme = 'Gruvbox Dark',
  default_prog = {
    -- '/bin/zsh',
    -- '-l',
    '/usr/local/bin/nu',
    '-l',
    '--config',
    '~/.config/nushell/config.nu',
    '--env-config',
    '~/.config/nushell/env.nu',
  },
  font = wt.font('JetBrains Mono'),
  font_size = 16,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  keys = {
    {
      key = ']',
      mods = 'ALT',
      action = wt.action({ ActivateTabRelative = 1 }),
    },
    {
      key = '[',
      mods = 'ALT',
      action = wt.action({ ActivateTabRelative = -1 }),
    },
  },
  initial_cols = 200,
  initial_rows = 45,
}
