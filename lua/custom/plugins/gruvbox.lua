return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.gruvbox_material_enable_italic = true
    vim.cmd.colorscheme 'gruvbox-material'
    vim.g.gruvbox_material_foreground = 'material'
    vim.g.gruvbox_material_background = 'hard'
    vim.api.nvim_set_hl(0, 'Normal', { bg = '#1e2122' })
  end,
}
