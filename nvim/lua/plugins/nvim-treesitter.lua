require('nvim-treesitter.configs').setup {
    ensure_installed = { 'python', 'lua', 'go' },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true
    }
}
