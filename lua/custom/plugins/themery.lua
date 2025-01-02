return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    require('themery').setup {
      themes = {
        'nordic',
        {
          name = 'night',
          colorscheme = 'tokyonight',
        },
        'monekai',
      },
      livePreview = true,
    }
  end,
  enabled = false,
}
