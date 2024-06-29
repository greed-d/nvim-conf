-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
local o = vim.opt
local g = vim.g

-------------------------------------- options ------------------------------------------
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

o.laststatus = 3
o.showmode = false

o.clipboard = 'unnamedplus'
o.cursorline = true
o.cursorlineopt = 'both'

o.termguicolors = true

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

o.winbar = '%f %m'

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

o.guifont = 'CaskaydiaCove Nerd Font:h11'
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

g.neovide_text_gamma = 0.9
g.neovide_text_contrast = 1.1

o.guifont = 'CaskaydiaMono Nerd Font:h13'
