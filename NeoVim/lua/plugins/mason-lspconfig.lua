return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",
      },
      handlers = {
        function(server_name)
          print("setting up ", server_name)
          require("lspconfig")[server_name].setup({})
        end,
      },
    })
  end,
}
