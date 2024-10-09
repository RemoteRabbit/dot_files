return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      mappings = {
        ["<leader>"] = {
          ["m"] = "<cmd>Mason<cr>",
        },
      },
    })
  end,
}
