vim.g.mapleader = ' '
vim.g.maplocalleader= ' '

vim.cmd([[filetype plugin indent on]])
vim.opt.smartindent = true


vim.opt.number = true
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.lazyredraw = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.showcmd = true

vim.opt.incsearch = true
vim.opt.hlsearch = true


vim.keymap.set('n', '<leader> h', ':nohlsearch<CR>')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('n', '<C-J>' , '<C-W><C-J>')
vim.keymap.set('n', '<C-K>' , '<C-W><C-K>')
vim.keymap.set('n', '<C-H>' , '<C-W><C-H>')
vim.keymap.set('n', '<C-L>' , '<C-W><C-L>')

vim.keymap.set('i', 'jk', '<esc>')

