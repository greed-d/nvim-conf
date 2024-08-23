return {
  'greeid/tokyodark.nvim',
  dev = true,
  dir = '~/Dev/hobby_projects/nvim_plugins/tokyodark.nvim/',
  opts = {
    -- custom options here
  },
  config = function(_, opts)
    require('tokyodark').setup(opts) -- calling setup is optional
    vim.cmd [[colorscheme tokyodark]]

    -- WARN: Change after changing colorscheme
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bold = true, fg = '#f09054' })
  end,
  enabled = false,
}
--
-- return {
--   'folke/tokyonight.nvim',
--   lazy = false,
--   priority = 1000,
--   opts = {},
-- }
-- Using lazy.nvim
-- return {
--   'ribru17/bamboo.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('bamboo').setup {
--       -- optional configuration here
--     }
--     require('bamboo').load()
--   end,
-- }
