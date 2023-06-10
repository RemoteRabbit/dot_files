return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    ensure_installed = {
        "lua_ls",
        "ansiblels",
        "arduino_language_server",
        "azure_pipelines_ls",
        "bashls",
        "dockerls",
        "docker_compose_language_service",
        "dotls",
        "gopls",
    },
    }