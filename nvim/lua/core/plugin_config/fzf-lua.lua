vim.keymap.set("n", "<c-f>" , "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set("n", "<c-g>" , "<cmd>lua require('fzf-lua').files({cwd='~/'})<CR>", { silent = true })
vim.keymap.set("n", "<c-p>" , "<cmd>lua require('fzf-lua').grep()<CR><CR>", { silent = true })
