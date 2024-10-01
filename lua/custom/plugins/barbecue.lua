return {
  'utilyre/barbecue.nvim',
  event = 'LspAttach',
  name = 'barbecue',
  enabled = true,
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons', -- optional dependency
  },
  opts = {
    config = true,
  },
}
