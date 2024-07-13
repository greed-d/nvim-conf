return {
  'andweeb/presence.nvim',
  event = 'BufReadPre',
  config = function()
    require('presence').setup {
      log_level = 'debug',
      main_image = 'neovim',

      -- NOTE: Rich presence text options
      editing_text = 'Editing file %s',
    }
  end,
}
