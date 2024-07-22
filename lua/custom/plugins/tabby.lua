return {
  'akinsho/bufferline.nvim',
  event = 'BufRead',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function()
    require('bufferline').setup {
      options = {
        separator_style = 'slant',
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = {
            Error = ' ',
            Warn = ' ',
          }
          local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    }
  end,
  -- enabled = false,
}
