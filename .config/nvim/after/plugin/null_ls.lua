local status, null_ls = pcall(require, 'null-ls')
if not status then
  return
end
local root_has_file = function(files)
  return function(utils)
    return utils.root_has_file(files)
  end
end

local eslint_root_files = { '.eslintrc', '.eslintrc.js', '.eslintrc.json' }
local prettier_root_files =
  { '.prettierrc', '.prettierrc.js', '.prettierrc.json' }

null_ls.setup({
  on_attach = function(client, _bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd.autocmd('BufWritePre <buffer> lua vim.lsp.buf.format()')
    end
  end,
  sources = {
    null_ls.builtins.formatting.stylua.with({
      extra_args = {
        '--indent-type',
        'Spaces',
        '--indent-width',
        '2',
        '--column-width',
        '80',
        '--quote-style',
        'AutoPreferSingle',
      },
    }),
    null_ls.builtins.diagnostics.eslint_d.with({
      condition = root_has_file(eslint_root_files),
      diagnostics_format = '[eslint] #{m}\n(#{c})',
    }),
    null_ls.builtins.formatting.eslint_d.with({
      condition = function(utils)
        local has_eslint = root_has_file(eslint_root_files)(utils)
        local has_prettier = root_has_file(prettier_root_files)(utils)
        return has_eslint and not has_prettier
      end,
    }),
    null_ls.builtins.formatting.prettierd.with({}),
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.completion.spell,
  },
})
