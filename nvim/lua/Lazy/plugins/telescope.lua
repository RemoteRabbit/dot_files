return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-t>"] = trouble.open_with_trouble,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    local wk = require("which-key")
    wk.register({
      f = {
        f = { "<cmd>Telescope find_files hidden=true<cr>", "Find File" }, -- create a binding with label
        o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false }, -- additional options for creating the keymap
      },
    }, { prefix = "<leader>" })
  end,
}
