-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
local o = vim.opt
local g = vim.g

-------------------------------------- options ------------------------------------------
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.laststatus = 3
o.showmode = false
o.scrolloff = 18

-- o.clipboard = 'unnamedplus'
o.cursorline = true
o.cursorlineopt = 'both'

o.termguicolors = true

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- o.winbar = '%f %m'

vim.opt.fillchars = { eob = ' ' }
o.ignorecase = true
o.smartcase = true
o.mouse = 'a'

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false
o.rnu = true

-- disable nvim intro
vim.opt.shortmess:append 'sI'

o.signcolumn = 'yes'
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
o.whichwrap:append '<>[]hl'

-- g.mapleader = " "

-- disable some default providers
g['loaded_node_provider'] = 0
g['loaded_python3_provider'] = 0
g['loaded_perl_provider'] = 0
g['loaded_ruby_provider'] = 0

-- NOTE: Neovide related settings below

g.neovide_text_gamma = 1.2
g.neovide_text_contrast = 0.2

o.guifont = 'JetBrainsMono Nerd Font:h12'
g.neovide_theme = 'tokyodark'
g.neovide_cursor_animation_length = 0.07
g.neovide_cursor_animate_in_insert_mode = true

g.neovide_cursor_animate_command_line = true
g.neovide_cursor_vfx_mode = 'pixiedust'
