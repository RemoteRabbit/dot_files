require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup{
    ensure_installed = {
        "bashls",
        "lua_ls",
        "lua_lsp",
        "terraformls",
        "tflint",
    }
}
