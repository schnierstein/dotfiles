local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
		-- ['<tab>'] = cmp.mapping.scroll_docs(1),
		["<C-o>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		--['<tab>'] = cmp.mapping.select_next_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
				-- that way you will only jump inside the snippet region
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-y>"] = cmp.mapping(function(fallback)
			cmp.mapping.abort()
			local copilot_keys = vim.fn["copilot#Accept"]()
			if copilot_keys ~= "" then
				vim.api.nvim_feedkeys(copilot_keys, "i", true)
			else
				fallback()
			end
		end),
	}),

	---mapping = {

	---    ["<CR>"] = cmp.mapping.confirm { select = true },
	---    ["<Tab>"] = cmp.mapping(function(fallback)
	---      if cmp.visible() then
	---        cmp.select_next_item()
	---      elseif luasnip.expand_or_jumpable() then
	---        luasnip.expand_or_jump()
	---      elseif has_words_before() then
	---        cmp.complete()
	---      else
	---        fallback()
	---      end
	---    end, { "i", "s" }),

	---    ["<S-Tab>"] = cmp.mapping(function(fallback)
	---      if cmp.visible() then
	---        cmp.select_prev_item()
	---      elseif luasnip.jumpable(-1) then
	---        luasnip.jump(-1)
	---      else
	---        fallback()
	---      end
	---    end, { "i", "s" }),
	---    },

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", keyword_length = 2 },
		{ name = "luasnip", keyword_length = 2 },
		--{ name = 'neorg' },
	}, {
		{ name = "buffer" },
	}),
})
