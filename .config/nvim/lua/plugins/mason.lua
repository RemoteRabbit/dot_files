return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  opts = {
    ensure_installed = {
      "ansiblels",
      "arduino_language_server",
      "azure_pipelines_ls",
      "bashls",
      "dockerls",
      "docker_compose_language_service",
      "dotls",
      "gopls",
    },
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
