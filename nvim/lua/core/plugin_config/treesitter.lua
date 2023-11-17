require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "rust", "ruby", "vim", "python", "julia", "cpp", "fortran", "make", "ssh_config", "yaml"},
        sync_install = false,
        auto_install = true,
        highlight = {
                enable = true,
        },
}
