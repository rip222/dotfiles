return {
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim', -- vscode-like pictograms for neovim lsp completion items
      'BeastCode/VSCode-Angular-TypeScript-Snippets',
      'sp90/angular-control-flow-snippets',
    },
    config = function()
      -- nvim-cmp setup
      local cmp_status, cmp = pcall(require, 'cmp')
      local snip_status, luasnip = pcall(require, 'luasnip')
      local kind_status, lspkind = pcall(require, 'lspkind')

      if not cmp_status and not snip_status and not kind_status then
        return
      end

      require('luasnip.loaders.from_vscode').lazy_load()

      local kind_icons = {
        Class = 'ﴯ',
        Color = '',
        Constant = '',
        Constructor = '',
        Enum = '',
        EnumMember = '',
        Event = '',
        Field = '',
        File = '',
        Folder = '',
        Function = '',
        Interface = '',
        Keyword = '',
        Method = '',
        Module = '',
        Operator = '',
        Property = 'ﰠ',
        Reference = '',
        Snippet = '',
        Struct = '',
        Text = '',
        TypeParameter = '',
        Unit = '',
        Value = '',
        Variable = '',
      }

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = lspkind.cmp_format {
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            preset = 'codicons',
            before = function(entry, vim_item)
              -- Kind icons
              vim_item.kind = string.format('%s', kind_icons[vim_item.kind]) --Concatonate the icons with name of the item-kind
              vim_item.menu = ({
                nvim_lsp = '[LSP]',
                spell = '[Spellings]',
                zsh = '[Zsh]',
                buffer = '[Buffer]',
                ultisnips = '[Snip]',
                treesitter = '[Treesitter]',
                calc = '[Calculator]',
                nvim_lua = '[Lua]',
                path = '[Path]',
                nvim_lsp_signature_help = '[Signature]',
                cmdline = '[Vim Command]',
              })[entry.source.name]
              return vim_item
            end,
          },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            -- behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
        },
      }

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })
    end,
  },
}
