return {
  'Theprimeagen/harpoon',
  config = true,
  -- event = 'BufRead',

  keys = {
    {
      'mf',
      function()
        require('harpoon.mark').add_file()
      end,
      desc = '[M]ark [F]ile',
    },
    {
      'ml',
      function()
        require('harpoon.ui').toggle_quick_menu()
      end,
      desc = '[M]ark [L]ist',
    },
    {
      '<C-j>',
      function()
        require('harpoon.ui').nav_file(1)
      end,

      desc = 'Move to 1st file in list',
    },
    {
      '<C-k>',
      function()
        require('harpoon.ui').nav_file(2)
      end,
      desc = 'Move to 2nd file in list',
    },
    {
      '<C-l>',
      function()
        require('harpoon.ui').nav_file(3)
      end,
      desc = 'Move to 3rd file in list',
    },
    {
      '<C-h>',
      function()
        require('harpoon.ui').nav_file(4)
      end,
      desc = 'Move to 4th file in list',
    },
    {
      'mt',
      function()
        require('harpoon.ui').nav_file(5)
      end,
      desc = 'Move to 5th file in the list',
    },
  },
}
