-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local map = vim.keymap.set

-- map('n', ';', ':', { desc = 'CMD enter command mode' })
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })
map({ 'n', 'v', 'x' }, '<S-h>', '^', { desc = 'Move to front of line' })
map({ 'n', 'v', 'x' }, '<S-l>', '$', { desc = 'Move to end of line' })
map({ 'n', 'v' }, '<', '<gv', { desc = 'Move indent left once' })
map({ 'n', 'v' }, '>', '>gv', { desc = 'Move indent left once' })
map({ 'n', 'v', 't', 'x' }, '<A-,>', '<C-w><', { desc = 'Decrease window size' })
map({ 'n', 'v', 't', 'x' }, '<A-.>', '<C-w>>', { desc = 'Move indent left once' })
map({ 'n', 'v', 'x' }, '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
map({ 'n', 'v', 'x' }, '<leader>Y', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
map({ 'n', 'v', 'x' }, '<leader>p', '"+p', { noremap = true, silent = true, desc = 'Paste from clipboard' })
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
map({'v', 'n'}, '<', '<gv')
map({'v', 'n'}, '>', '>gv')
map('x', 'p', 'p:let @"=@0<CR>', { silent = true })

map('n', '<C-s>', '<cmd>w<CR>', { desc = 'file save' })
map('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'file copy whole' })

-- NOTE: Buffer stuffs

map({ 'n', 'v' }, '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Move indent left once' })
map({ 'n', 'v' }, '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Move indent left once' })
map('n', '<leader>b', '<cmd>enew<CR>', { desc = 'buffer new' })

map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
map('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
map('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
map('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
map('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab

map('n', '<leader>sa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>', { desc = 'telescope [S]earch [A]ll files' })
map('n', '<leader>o', '<cmd>Oil<CR>', { desc = 'Toggle [O]il' })
map('n', '<leader>bk', '<cmd>bdelete<CR>', { desc = 'close buffers' })

-- NOTE: Terminal Stuff

map('t', '<C-x>', '<C-\\><C-N>', { desc = 'terminal escape terminal mode' })

map({ 'n', 'v', 'i', 't' }, '<M-b>', function()
  local terminal = require 'nvterm.terminal'
  local file = vim.fn.expand '%'
  local sfile = vim.fn.expand '%:r'
  local ft_cmds = {
    sh = 'bash ' .. file,
    rust = 'cargo ' .. file,
    python = 'python3 ' .. file,
    javascript = 'node ' .. file,
    java = 'javac ' .. file .. ' && java ' .. sfile,
    go = 'go build && go run ' .. file,
    c = 'g++ ' .. file .. ' -o ' .. sfile .. ' && ./' .. sfile,
    cpp = 'g++ ' .. file .. ' -o ' .. sfile .. ' && ./' .. sfile,
    typescript = 'deno compile ' .. file .. ' && deno run ' .. file,
  }

  -- Save current buffer
  local current_bufnr = vim.fn.bufnr '%'
  vim.cmd 'w'

  -- Open terminal and run command
  terminal.send(ft_cmds[vim.bo.ft], 'float')

  -- Focus back to terminal window
  vim.cmd 'wincmd p'
end, { desc = 'Build and Run file' })

-- toggleable
map({ 'n', 't' }, '<A-v>', function()
  require('nvterm.terminal').toggle 'vertical'
end, { desc = 'Show vertical terminal' })

map({ 'n', 't' }, '<A-h>', function()
  require('nvterm.terminal').toggle 'horizontal'
end, { desc = 'Show horizontal terminal' })

map({ 'n', 't' }, '<A-i>', function()
  require('nvterm.terminal').toggle 'float'
end, { desc = 'Show floating terminal' })
-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

map({ 'n', 'v', 't' }, '\\', '<cmd>Neotree toggle<CR>', { desc = 'Toggle neo-tree' })

-- NOTE: Diagnostic keymaps

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode

-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Flutter tools
map({ 'n', 'v' }, '<leader>fl', '<cmd>Telescope flutter commands<CR>', { desc = '[F][L]utter tools' })

-- NOTE: Undotree
map('n', '<leader>u', '<cmd>UndotreeToggle<CR>', { desc = '[U]ndo Tree Toggle' })

-- vim: ts=2 sts=2 sw=2 et
