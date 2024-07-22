-- return {
--   'lukas-reineke/indent-blankline.nvim',
--   event = 'BufReadPre',
--   main = 'ibl',
--   opts = {
--     indent = { char = '│' },
--     scope = {
--       show_start = false,
--       show_end = false,
--     },
--     exclude = {
--       buftypes = { 'terminal', 'nofile' },
--     },
--   },
-- }
return {
  'nvimdev/indentmini.nvim',
  event = 'User FilePost',
  config = function()
    require('indentmini').setup {
      char = '│',
      -- Colors are applied automatically based on user-defined highlight groups.
      -- There is no default value.
      vim.cmd.highlight 'IndentLine guifg=#545560',
      -- Current indent line highlight
      vim.cmd.highlight 'IndentLineCurrent guifg=#A0A8CD',
    }
  end,
}
