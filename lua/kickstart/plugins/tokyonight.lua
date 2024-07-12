return {
  'tiagovla/tokyodark.nvim',
  opts = {
    -- custom options here
  },
  config = function(_, opts)
    require('tokyodark').setup(opts) -- calling setup is optional
    vim.cmd [[colorscheme tokyodark]]

    -- WARN: Change after changing colorscheme
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#f09054' })
  end,
}
