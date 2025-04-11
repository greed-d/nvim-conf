return {
  'vyfor/cord.nvim',
  branch = 'master',
  build = ':Cord update',
  event = 'VeryLazy',
  opts = {}, -- calls require('cord').setup()
}
