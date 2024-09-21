-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
   'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = function()
      -- lua, default settings
      require('better_escape').setup {
        timeout = vim.o.timeoutlen,
        default_mappings = false,
        mappings = {
          i = {
            j = {
              -- These can all also be functions
              k = '<Esc>',
              j = '<Esc>',
            },
          },
          c = {
            j = {
              k = '<Esc>',
              j = '<Esc>',
            },
          },
          v = {
            j = {
              k = '<Esc>',
            },
          },
          s = {
            j = {
              k = '<Esc>',
            },
          },
        },
      }
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    setup = true;
  }

  

}
