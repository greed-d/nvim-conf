return {
  'AlexvZyl/nordic.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('nordic').setup {
      -- This callback can be used to override the colors used in the base palette.
      on_palette = function(palette) end,
      -- This callback can be used to override the colors used in the extended palette.
      after_palette = function(palette) end,
      -- This callback can be used to override highlights before they are applied.
      -- Enable bold keywords.
      bold_keywords = true,
      -- Enable italic comments.
      italic_comments = true,
      -- Enable editor background transparency.
      transparent = {
        -- Enable transparent background.
        bg = false,
        -- Enable transparent background for floating windows.
        float = false,
      },
      on_highlight = function(highlights, palette)
        highlights.TelescopePromptTitle = {
          fg = palette.black0,
          bg = palette.orange.dim,
          -- italic = true,
          bold = false,
          underline = false,
          sp = palette.yellow.dim,
          undercurl = false,
        }
        highlights.TelescopeResultsTitle = {
          fg = palette.black0,
          bg = palette.orange.dim,
          -- italic = true,
          bold = false,
          underline = false,
          sp = palette.yellow.dim,
          undercurl = false,
        }
        highlights.TelescopePreviewTitle = {
          fg = palette.black0,
          bg = palette.blue1,
          -- italic = true,
          bold = false,
          underline = false,
          sp = palette.yellow.dim,
          undercurl = false,
        }
        highlights.TelescopeSelection = {
          fg = palette.yellow.bright,
          bg = palette.gray1,
          -- italic = true,
          bold = false,
          underline = false,
          -- sp = palette.yellow.dim,
          undercurl = false,
        }
        highlights.TelescopeSelectionCaret = {
          fg = palette.yellow.bright,
          bg = palette.gray1,
          -- italic = true,
          bold = false,
          underline = false,
          -- sp = palette.yellow.dim,
          undercurl = false,
        }
      end,
      -- Enable brighter float border.
      bright_border = false,
      -- Reduce the overall amount of blue in the theme (diverges from base Nord).
      reduced_blue = true,
      -- Swap the dark background with the normal one.
      swap_backgrounds = false,
      -- Cursorline options.  Also includes visual/selection.
      cursorline = {
        -- Bold font in cursorline.
        bold = false,
        -- Bold cursorline number.
        bold_number = true,
        -- Available styles: 'dark', 'light'.
        theme = 'dark',
        -- Blending the cursorline bg with the buffer bg.
        blend = 0.85,
      },
      noice = {
        -- Available styles: `classic`, `flat`.
        style = 'classic',
      },
      telescope = {
        -- Available styles: `classic`, `flat`.
        style = 'flat',
      },
      leap = {
        -- Dims the backdrop when using leap.
        dim_backdrop = false,
      },
      ts_context = {
        -- Enables dark background for treesitter-context window
        dark_background = true,
      },
      vim.api.nvim_set_hl(0, 'CursorLineNr', { bold = true, fg = '#f09054' }),
    }
    require('nordic').load()
  end,
  enabled = true,
}
