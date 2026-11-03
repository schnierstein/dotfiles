-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	-- checker = { enabled = true },
})

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

vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>")
--vim.keymap.set("n", "<leader>q", "<cmd>lua require('CopilotChat').toggle()<CR>")
vim.keymap.set("n", "<c-q>", "<cmd>lua require('CopilotChat').toggle()<CR>")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+yg_')
vim.keymap.set("n", "<leader>yy", '"+yy')

vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>P", '"+P')




vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

--vim.keymap.set('n', '<C-J>' , '<C-W><C-J>')
--vim.keymap.set('n', '<C-K>' , '<C-W><C-K>')
--vim.keymap.set('n', '<C-H>' , '<C-W><C-H>')
--vim.keymap.set('n', '<C-L>' , '<C-W><C-L>')

vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "E", "$")
vim.keymap.set("n", "B", "0")

vim.keymap.set("v", "E", "$")
vim.keymap.set("v", "B", "0")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
