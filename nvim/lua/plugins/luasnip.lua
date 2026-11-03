return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "v2.*",
	build = "make install_jsregexp",

	-- Add dedicated jump keys
	keys = {
		{
			"<C-j>", -- Ctrl+j to jump forward
			function()
				local ls = require("luasnip")
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end,
			mode = { "i", "s" },
			silent = true,
			desc = "Jump forward in snippet",
		},
		{
			"<C-k>", -- Ctrl+k to jump backward
			function()
				local ls = require("luasnip")
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end,
			mode = { "i", "s" },
			silent = true,
			desc = "Jump backward in snippet",
		},
	},

	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		local ls = require("luasnip")

		-- Your custom snippet goes here
		ls.add_snippets("tex", {
			ls.snippet("si", {
				ls.text_node("\\(\\SI{"),
				ls.insert_node(1),
				ls.text_node("}{\\"),
				ls.insert_node(2),
				ls.text_node("}\\)"),
				ls.insert_node(0),
			}),
		})
		ls.add_snippets("tex", {
			ls.snippet("sir", {
				ls.text_node("\\(\\SIrange{"),
				ls.insert_node(1),
				ls.text_node("}{"),
				ls.insert_node(2),
				ls.text_node("}{\\"),
				ls.insert_node(3),
				ls.text_node("}\\)"),
				ls.insert_node(0),
			}),
		})
		ls.add_snippets("tex", {
			ls.snippet("cbox", {
				ls.text_node("%"),
				-- Left dashes
				ls.function_node(function(args)
					local text = args[1][1]
					local target_width = 30 -- The width between the % signs
					local dashes = target_width - string.len(text)
					return string.rep("-", math.max(0, math.floor(dashes / 2)))
				end, { 1 }),

				-- The text you type
				ls.insert_node(1, "TEXT"),

				-- Right dashes
				ls.function_node(function(args)
					local text = args[1][1]
					local target_width = 30 -- Must match the target_width above
					local dashes = target_width - string.len(text)
					return string.rep("-", math.max(0, math.ceil(dashes / 2)))
				end, { 1 }),
				ls.text_node("%"),

				-- Exit node on a new line
				ls.text_node({ "", "" }),
				ls.insert_node(0),
			}),
		})
	end,
}
