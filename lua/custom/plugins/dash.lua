return {

  'nvimdev/dashboard-nvim',
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = true,
      },
      config = {
        header = {
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          '██████╗ ██████╗ ███████╗███████╗██████╗ ',
          '██╔════╝ ██╔══██╗██╔════╝██╔════╝██╔══██╗',
          '██║  ███╗██████╔╝█████╗  █████╗  ██║  ██║',
          '██║   ██║██╔══██╗██╔══╝  ██╔══╝  ██║  ██║',
          '╚██████╔╝██║  ██║███████╗███████╗██████╔╝',
          ' ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═════╝ ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
        },
          -- stylua: ignore
          center = {
            {
            action = 'Telescope find_files',
            desc = "Find File                ",
            desc_hl = 'blue',
            icon = "  >> ",
            key = "f" ,
            icon_hl = "blue",
            key_hl = "orange",
            key_format = " %s",
          },
            {
            action = "ene | startinsert",
            desc = "New File",
            desc_hl = 'blue',
            icon = "  >> ",
            key = "n" ,
            icon_hl = "blue",
            key_hl = "orange",
            key_format = " %s",
          },
            {
            action = "require('telescope.builtin').oldfiles()",
            desc = "Recent Files",
            desc_hl = 'blue',
            icon = "  >> ",
            key = "r" ,
            icon_hl = "blue",
            key_hl = "orange",
            key_format = " %s",
          },
            {
            action = "require('telescope.builtin').live_grep()",
            desc = "Find Text",
            desc_hl = 'blue',
            icon = "  >> ",
            key = "w" ,
            icon_hl = "blue",
            key_hl = "orange",
            key_format = " %s",
          },
          {
            action = "require('telescope.builtin').find_files {cwd = vim.fn.stdpath 'config' }",
            desc = "Config",
            desc_hl = 'blue',
            icon = "  >> ",
            key = "c" ,
            icon_hl = "blue",
            key_hl = "orange",
            key_format = " %s",
          },
          {
            action = "Lazy",
            desc = "Lazy",
            desc_hl = 'blue',
            icon = "󰒲  >> ",
            key = "l" ,
            icon_hl = "blue",
            key_hl = "orange",
            key_format = " %s",
          },
          {
            action = function() vim.api.nvim_input("<cmd>qa<cr>") end,
            desc = "Quit",
            desc_hl = 'blue',
            icon = "  >> ",
            key = "q" ,
            icon_hl = "blue",
            key_hl = "orange",
            key_format = " %s",
          },
          {
            action = "",
            desc = " ",
            icon = "",
            key_format = " %s",
          },
          {
            action = "",
            desc = " ",
            icon = "",
            key_format = " %s",
          }
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '  Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    }
  end,
}
