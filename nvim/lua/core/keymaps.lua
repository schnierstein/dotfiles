vim.g.mapleader = ','
vim.g.maplocalleader= ','

vim.cmd([[filetype plugin indent on]])


vim.opt.number = true
vim.opt.relativenumber = true
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


vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('n', '<C-J>' , '<C-W><C-J>')
vim.keymap.set('n', '<C-K>' , '<C-W><C-K>')
vim.keymap.set('n', '<C-H>' , '<C-W><C-H>')
vim.keymap.set('n', '<C-L>' , '<C-W><C-L>')

vim.keymap.set('i', 'jk', '<esc>')

vim.keymap.set('n', 'E', '$')
vim.keymap.set('n', 'B', '0')

vim.keymap.set('v', 'E', '$')
vim.keymap.set('v', 'B', '0')

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- vim.opt.colorcolumn = "80"

