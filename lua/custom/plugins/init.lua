-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'max397574/better-escape.nvim',
  event = 'InsertEnter',
  config = function()
    require('better_escape').setup()
  end,
}
