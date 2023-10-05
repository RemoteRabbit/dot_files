return {
  "stevearc/conform.nvim",
  opts = {},
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        markdown = { "markdownlint" },
        python = { "isort", "black" },
        terraform = { "terraform_fmt" },
        yaml = { "yamlfix", "yamlfmt" },
        ["_"] = { "trim_whitespace" },
        ["*"] = { "codespell" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
      notify_on_error = true,
    })
  end,
}
