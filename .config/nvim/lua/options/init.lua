local opt = vim.o
local cmd = vim.cmd
local map = vim.keymap.set
local gitsigns = require('gitsigns')

-- OPTIONS
opt.number = true
opt.cursorline = true
opt.relativenumber = true
vim.opt.expandtab = true
opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
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

-- F5 processes the document once, and refreshes the view
map({ 'n', 'v', 'i' },'<F5>', function() require("knap").process_once() end)

-- F6 closes the viewer application, and allows settings to be reset
map({ 'n', 'v', 'i' },'<F6>', function() require("knap").close_viewer() end)

-- F7 toggles the auto-processing on and off
map({ 'n', 'v', 'i' },'<F7>', function() require("knap").toggle_autopreviewing() end)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
map({ 'n', 'v', 'i' },'<F8>', function() require("knap").forward_jump() end)

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
map('n', '<leader>t', builtin.builtin, {})

map({ 't' },'<Esc>', "<C-\\><C-n>")
cmd('autocmd TermOpen * setlocal nonumber norelativenumber')

require('options/colors')

-- Other stuff
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.defer_fn(function()
      vim.cmd("TSEnable highlight")
    end, 0)
  end
})

vim.g.haskell_tools = {
  hls = {
    settings = { -- This was missing 
      haskell = {
        formattingProvider = 'fourmolu', 
      }
    }
  }
}

local gknapsettings = {
    texoutputext = "pdf",
    textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
    textopdfviewerlaunch = "zathura %outputfile%",
    --textopdfviewerrefresh = "kill -HUP %pid%"
}

vim.g.knap_settings = gknapsettings

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.tex",
  command = "0r ~/math/.template.tex"
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.hs",
  callback = function()
    if vim.fn.search('\t', 'n') ~= 0 then
      vim.cmd([[%s/\t/  /g]])
      vim.cmd('imap <Tab> <Space><Space>')
    end
  end
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.tex",
  callback = function()
    if vim.fn.search('\t', 'n') ~= 0 then
      vim.cmd([[%s/\t/  /g]])
      vim.cmd('imap <Tab> <Space><Space>')
    end
  end
})
