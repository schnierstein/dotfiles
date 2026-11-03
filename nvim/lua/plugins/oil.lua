return{
	{
		'stevearc/oil.nvim',
  		dependencies = { { "echasnovski/mini.icons", opts = {} } },
  		lazy = false,
  		config = function()
	  		require("oil").setup({
		  		columns = {"icon"},
		  		keymaps = {
			  		["<C-h>"] = false,
			  		["<C-l>"] = false,
			  		["<C-k>"] = false,
			  		["<C-j>"] = false,
					["<C-v>"] = {"actions.select", opts={vertical=true}},
					["<C-x>"] = {"actions.select", opts={horizontal=true}},
		  		},
		  		view_options = {show_hidden = true},
				float = {
					padding = 2,
					max_width=0.9,
					max_height=0.9,
					preview_split= "right",
				},
	  		})
	  		vim.keymap.set("n","-","<CMD>Oil --float --preview<CR>", {desc="Open parent directory"})
  		end,
	},
}
