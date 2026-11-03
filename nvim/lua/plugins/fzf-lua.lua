return{
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = {},
	config = function()
		vim.keymap.set("n", "<c-f>" , "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
		vim.keymap.set("n", "<c-g>" , "<cmd>lua require('fzf-lua').files({cwd='~/'})<CR>", { silent = true })
		vim.keymap.set("n", "<c-p>" , "<cmd>lua require('fzf-lua').grep()<CR><CR>", { silent = true })
	end,
}
