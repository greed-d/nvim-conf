return {
  'nvim-lualine/lualine.nvim',

  dependencies = {
    'nvim-tree/nvim-web-devicons',
    { 'greeid/lualine-so-fancy.nvim', dev = true, { dir = '~/Dev/hobby_projects/nvim_plugins/lualine-so-fancy.nvim/' } },
  },
  -- event = 'VeryLazy',
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = ' '
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = {
    options = {
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      globalstatus = true,
      refresh = {
        statusline = 100,
      },
    },
    sections = {
      lualine_a = {
        { 'mode', width = 3 },
      },
      lualine_b = {
        function()
          local file = vim.fn.expand '%:t'
          local extension = vim.fn.expand '%:e'
          local icon = require('nvim-web-devicons').get_icon(file, extension)
          return icon .. ' ' .. file
        end,
      },
      lualine_c = {
        { 'fancy_branch', icon = '' },
        {
          'fancy_diff',
          symbols = { added = ' ', modified = ' ', removed = ' ' }, -- Changes the symbols used by the diff.
          colored = true,
        },
      },
      lualine_x = {
        { 'fancy_macro' },
        {
          'fancy_diagnostics',
          diagnostics_color = {
            error = { fg = '#ee6d85' },
          },
          symbols = { error = ' ', warn = ' ', info = '󰋼 ', hint = '󰛩 ' },
        },
        { 'fancy_searchcount' },
        {
          'fancy_location',
        },
      },
      lualine_y = {
        { 'fancy_lsp_servers' },
      },
      lualine_z = {
        function()
          local cwd = vim.fn.getcwd()
          return '󰉖 ' .. (cwd:match '([^/\\]+)[/\\]*$' or cwd)
        end,
      },
    },
  },
}
