local status, prettier = pcall(require, "prettier")
if not status then
  return
end

prettier.setup({
  bin = "prettierd",
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  cli_options = {
    arrow_parens = "always",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    print_width = 80,
    semi = true,
    single_quote = true,
    tab_width = 2,
    trailing_comma = "es5",
  },
})
