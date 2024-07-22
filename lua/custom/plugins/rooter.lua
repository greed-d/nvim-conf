-- Lua
return {
  'ahmedkhalf/project.nvim',
  event = 'User FilePost',
  config = function()
    require('project_nvim').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end,
}
