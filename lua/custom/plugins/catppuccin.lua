return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, 
  config = function()
    vim.cmd.colorscheme 'catppuccin'
    require("catppuccin").setup({ flavour = "mocha" })

    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = '#f38ba8'})
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = '#a6e3a1'})
  end

}
