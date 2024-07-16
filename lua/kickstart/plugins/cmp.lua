return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          { 'onsails/lspkind.nvim' },

          'hrsh7th/nvim-cmp',
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        config = function(_, opts)
          if opts then
            require('luasnip').config.setup(opts)
          end
          vim.tbl_map(function(type)
            require('luasnip.loaders.from_' .. type).lazy_load()
          end, { 'vscode', 'snipmate', 'lua' })
          -- friendly-snippets - enable standardized comments snippets
          require('luasnip').filetype_extend('typescript', { 'tsdoc' })
          require('luasnip').filetype_extend('javascript', { 'jsdoc' })
          require('luasnip').filetype_extend('lua', { 'luadoc' })
          require('luasnip').filetype_extend('python', { 'pydoc' })
          require('luasnip').filetype_extend('rust', { 'rustdoc' })
          require('luasnip').filetype_extend('cs', { 'csharpdoc' })
          require('luasnip').filetype_extend('java', { 'javadoc' })
          require('luasnip').filetype_extend('c', { 'cdoc' })
          require('luasnip').filetype_extend('cpp', { 'cppdoc' })
          require('luasnip').filetype_extend('php', { 'phpdoc' })
          require('luasnip').filetype_extend('kotlin', { 'kdoc' })
          require('luasnip').filetype_extend('ruby', { 'rdoc' })
          require('luasnip').filetype_extend('sh', { 'shelldoc' })
        end,
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'
      -- See `:help cmp`
      local cmp = require 'cmp'
      luasnip.config.setup {}

      local cmp_hl = function(item, bg, fg)
        vim.api.nvim_set_hl(0, item, { bg = bg, fg = fg })
      end

      local colors = {
        white = '#A0A8CD',
        darker_black = '#0c0d18',
        black = '#11121D', --  nvim bg
        black2 = '#171823',
        one_bg = '#1d1e29',
        one_bg2 = '#252631',
        one_bg3 = '#252631',
        grey = '#474853',
        grey_fg = '#474853',
        grey_fg2 = '#4e4f5a',
        light_grey = '#545560',
        red = '#ee6d85',
        baby_pink = '#fd7c94',
        pink = '#fe6D85',
        line = '#252631',
        green = '#98c379',
        vibrant_green = '#95c561',
        nord_blue = '#648ce1',
        blue = '#7199ee',
        yellow = '#d7a65f',
        sun = '#dfae67',
        purple = '#a485dd',
        dark_purple = '#9071c9',
        teal = '#519aba',
        orange = '#f6955b',
        cyan = '#38a89d',
        statusline_bg = '#161722',
        lightbg = '#2a2b36',
        pmenu_bg = '#ee6d85',
        folder_bg = '#7199ee',
      }

      local base16 = {
        base00 = '#11121d',
        base01 = '#1b1c27',
        base02 = '#21222d',
        base03 = '#282934',
        base04 = '#30313c',
        base05 = '#abb2bf',
        base06 = '#b2b9c6',
        base07 = '#A0A8CD',
        base08 = '#ee6d85',
        base09 = '#7199ee',
        base0A = '#7199ee',
        base0B = '#dfae67',
        base0C = '#a485dd',
        base0D = '#95c561',
        base0E = '#a485dd',
        base0F = '#f3627a',
      }

      local kind_icons = {
        Text = '󰉿',
        Method = '󰆧',
        Function = '󰊕',
        Constructor = '',
        Field = '󰜢',
        Variable = '󰀫',
        Class = '󰠱',
        Interface = '',
        Module = '',
        Property = '󰜢',
        Unit = '󰑭',
        Value = '󰎠',
        Enum = '',
        Keyword = '󰌋',
        Snippet = '',
        Color = '󰏘',
        File = '󰈙',
        Reference = '󰈇',
        Folder = '󰉋',
        EnumMember = '',
        Constant = '󰏿',
        Struct = '󰙅',
        Event = '',
        Operator = '󰆕',
        TypeParameter = '',
      }

      local borderstyle = {
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        -- winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None',
        winhighlight = 'Normal:CmpPmenu,CursorLine:CmpSel,Search:None',
      }

      ---@diagnostic disable
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        window = {
          completion = borderstyle,
          documentation = borderstyle,
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'buffer' },
          { name = 'path' },
        },

        cmp_hl('CmpItemKindConstant', 'NONE', base16.base09),
        cmp_hl('CmpItemKindFunction', 'NONE', base16.base0D),
        cmp_hl('CmpItemKindIdentifier', 'NONE', base16.base08),
        cmp_hl('CmpItemKindField', 'NONE', base16.base08),
        cmp_hl('CmpItemKindVariable', 'NONE', base16.base0E),
        cmp_hl('CmpItemKindSnippet', 'NONE', colors.red),
        cmp_hl('CmpItemKindText', 'NONE', base16.base0B),
        cmp_hl('CmpItemKindStructure', 'NONE', base16.base0E),
        cmp_hl('CmpItemKindType', 'NONE', base16.base0A),
        cmp_hl('CmpItemKindKeyword', 'NONE', base16.base07),
        cmp_hl('CmpItemKindMethod', 'NONE', base16.base0D),
        cmp_hl('CmpItemKindConstructor', 'NONE', colors.blue),
        cmp_hl('CmpItemKindFolder', 'NONE', base16.base07),
        cmp_hl('CmpItemKindModule', 'NONE', base16.base0A),
        cmp_hl('CmpItemKindProperty', 'NONE', base16.base08),
        cmp_hl('CmpItemKindEnum', 'NONE', colors.blue),
        cmp_hl('CmpItemKindUnit', 'NONE', base16.base0E),
        cmp_hl('CmpItemKindClass', 'NONE', colors.teal),
        cmp_hl('CmpItemKindFile', 'NONE', base16.base07),
        cmp_hl('CmpItemKindInterface', 'NONE', colors.green),
        cmp_hl('CmpItemKindColor', 'NONE', colors.white),
        cmp_hl('CmpItemKindReference', 'NONE', base16.base05),
        cmp_hl('CmpItemKindEnumMember', 'NONE', colors.purple),
        cmp_hl('CmpItemKindStruct', 'NONE', base16.base0E),
        cmp_hl('CmpItemKindValue', 'NONE', colors.cyan),
        cmp_hl('CmpItemKindEvent', 'NONE', colors.yellow),
        cmp_hl('CmpItemKindOperator', 'NONE', base16.base05),
        cmp_hl('CmpItemKindTypeParameter', 'NONE', base16.base08),
        cmp_hl('CmpItemKindCopilot', 'NONE', colors.green),
        cmp_hl('CmpItemKindCodeium', 'NONE', colors.vibrant_green),
        cmp_hl('CmpItemKindTabNine', 'NONE', colors.baby_pink),
        -- cmp_hl('CmpItemMenu', 'NONE', colors.light_grey),
        cmp_hl('CmpItemAbbrDeprecated', 'NONE', '#474853'),
        cmp_hl('CmpItemKindFunction', 'NONE', '#95c561'),
        cmp_hl('CmpItemKindMethod', 'NONE', '#95c561'),
        cmp_hl('CmpSel', '#fe6d85', '#11121D'),

        vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#7199ee', bold = true }),
        vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' }),

        formatting = {
          fields = { 'abbr', 'kind', 'menu' },
          format = function(entry, vim_item)
            local kind = require('lspkind').cmp_format { mode = 'text', maxwidth = 50 }(entry, vim_item)
            local strings = vim.split(kind.kind, ' ', { trimempty = true })
            kind.kind = string.format('%s  %s', kind_icons[vim_item.kind], strings[1]) -- This concatenates the icons with the name of the item kind
            kind.menu = '' .. (strings[2] or '') .. ''

            -- NOTE: Set icon color for kind.menu

            return kind
          end,
        },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
