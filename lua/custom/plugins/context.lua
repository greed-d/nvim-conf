return {
  'nvim-treesitter/nvim-treesitter-context',
  enabled = false,
  event = 'LspAttach',
  keys = {
    {
      '[c',
      function()
        require('treesitter-context').go_to_context(vim.v.count1)
      end,
      desc = 'Jump to upwards context',
    },
  },
  config = function()
    require('treesitter-context').setup()
  end,
}
