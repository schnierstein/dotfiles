return {
	{
		"pablopunk/pi.nvim",
		config = function()
			require("oil").setup()
			-- Ask pi with the current buffer as context
			vim.keymap.set("n", "<leader>m", ":PiAsk<CR>", { desc = "Ask pi" })

			-- Ask pi with visual selection as context
			vim.keymap.set("v", "<leader>m", ":PiAskSelection<CR>", { desc = "Ask pi (selection)" })
		end,
	},
}
