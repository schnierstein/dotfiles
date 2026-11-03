return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts =
			-- See Configuration section for options
			{
				-- model = "gpt-4.1", -- AI model to use
				-- temperature = 0.1, -- Lower = focused, higher = creative
				window = {
					layout = "vertical", -- 'vertical', 'horizontal', 'float'
					width = 0.5, -- 50% of screen width
				},
				headers = {
					user = "👤 You: ",
					assistant = "🤖 Copilot: ",
					tool = "🔧 Tool: ",
				},
				separator = "━━",
				show_folds = false, -- Disable folding for cleaner look
				auto_insert_mode = false, -- Enter insert mode when opening
			},
	},
}
