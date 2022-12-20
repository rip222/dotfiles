local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

null_ls.setup({
  on_attach = function(client, _bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd.autocmd("BufWritePre <buffer> lua vim.lsp.buf.format()")
    end
  end,
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.stylua.with({
      extra_args = {
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
        "--column-width",
        "120",
        -- "--quote-style",
        -- "AutoPreferSingle",
      },
    }),
    -- null_ls.builtins.code_actions.eslint_d,
    -- null_ls.builtins.diagnostics.tsc,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = "[eslint] #{m}\n(#{c})",
    }),
    -- null_ls.builtins.completion.spell,
  },
})
