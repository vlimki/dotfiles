local opt = vim.opt
local cmd = vim.cmd
local map = vim.keymap.set
local gitsigns = require('gitsigns')

-- OPTIONS
opt.number = true
opt.cursorline = true
opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.cmd('imap <Tab> <Space><Space>')
opt.laststatus = 3
opt.termguicolors = true
vim.wo.fillchars='eob: '
opt.expandtab = false
vim.o.synmaxcol = 400
vim.cmd('set nocompatible')
vim.cmd('filetype off')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
cmd('set fillchars+=eob:\\ ')

-- KEYBINDS
map('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
map('n', '<C-t>', ':NvimTreeFocus<CR>', { noremap = true })
map('n', '<leader>f', vim.lsp.buf.format, opts)
map('n', '<leader>b', function() gitsigns.blame_line{full=false} end)


local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
map('n', '<leader>t', builtin.builtin, {})

map({ 't' },'<Esc>', "<C-\\><C-n>")
cmd('autocmd TermOpen * setlocal nonumber norelativenumber')

require('options/colors')

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.defer_fn(function()
      vim.cmd("TSEnable highlight")
    end, 0)
  end
})
