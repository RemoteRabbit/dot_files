return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mti = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "bash-language-server",
        "beautysh",
        "cssls",
        "doctoc",
        "elixir-ls",
        "emmet-ls",
        "grammarly-languageserver",
        "html",
        "lua-language-server",
        "luacheck",
        "luaformatter",
        "luau-lsp",
        "markdownlint",
        "marksman",
        "misspell",
        "pyright",
        "shellharden",
        "sourcery",
        "tailwindcss-language-server",
        "terraform-ls",
        "tflint",
        "tfsec",
      },
      automatic_installation = true,
    })

    mti.setup({
      ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua", -- lua formatter
        "eslint_d", -- ts/js linter
      },
      auto_update = true,
    })
  end,
}
