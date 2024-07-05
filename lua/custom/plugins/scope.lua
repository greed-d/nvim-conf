return {
  'tiagovla/scope.nvim',
  event = 'BufRead',
  config = function()
    require('scope').setup { restore_state = true }
  end,
  enabled = false,
}
