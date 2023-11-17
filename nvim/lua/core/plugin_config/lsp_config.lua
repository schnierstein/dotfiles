require("mason").setup()
require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "clangd", "fortls", "jedi_language_server", "bashls", "julials", "texlab"}
})

local on_attach = function (_,_)
        vim.keymap.set('n','<leader>rn>', vim.lsp.buf.rename, {})
        vim.keymap.set('n','<leader>ca>', vim.lsp.buf.code_action, {})

        vim.keymap.set('n','gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n','gi', vim.lsp.buf.implementation, {})
        -- vim.keymap.set('n','gr', require('telescope.builtin').lsp_referecnes, {})
        vim.keymap.set('n','K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities
}

require("lspconfig").clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities
}
require("lspconfig").fortls.setup {
        on_attach = on_attach,
        capabilities = capabilities
}
require("lspconfig").jedi_language_server.setup {
        on_attach = on_attach,
        capabilities = capabilities,

        -- settings did not work.. 
        -- had to go to ~/.local/share/nvim/mason/packages/jedi-language-server/venv/pyvenv.cfg
        -- and change include-system-site-packages = true 


        -- settings = {
        --         jediSettings = {
        --                 autoImportModules = {"numpy"}
        --         }
        -- }
}

require("lspconfig").bashls.setup {
        on_attach = on_attach,
        capabilities = capabilities
}
require("lspconfig").julials.setup {
        on_attach = on_attach,
        capabilities = capabilities
}
require("lspconfig").texlab.setup {
        on_attach = on_attach,
        capabilities = capabilities
}
