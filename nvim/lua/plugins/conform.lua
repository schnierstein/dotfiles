return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				fortran = { "findent" },
				c = { "clangformat" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				timeout_ms = 500,
			},
			formatters = {
				["clang-format"] = {
					-- prepend_args = { "--style=file", "--fallback-style=LLVM" },
					prepend_args = { "--style=file", "--fallback-style=Google" },
				},
			},
		})
		vim.keymap.set("n", "<leader>f", "<cmd>lua require('conform').format()<CR>")
	end,
}
