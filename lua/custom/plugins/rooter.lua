-- Lua
return {
  'https://gitlab.com/Biggybi/nvim-smartcd.git',
  opts = {},
  event = { 'BufEnter', 'BufRead' },
  -- optional (only makes sense if 'create_cmd' is true)
  cmd = 'SmartCd',
  -- optional (only makes sense if 'create_keymap' is true)
  keys = {
    {
      '<leader>cd',
      '<cmd>SmartCd<CR>',
      desc = 'SmartCd',
    },
  },
}
