return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local open_with_trouble = require("trouble.sources.telescope").open
    local add_to_trouble = require("trouble.sources.telescope").add

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-t>"] = open_with_trouble,
          },
          n = {
            ["<C-t>"] = open_with_trouble,
          }
        },
      },
    })

    telescope.load_extension("fzf")

    vim.keymap.set('n', '<leader>ff', function()
      require('telescope.builtin').find_files({ hidden = true })
    end, { desc = 'Find files (including hidden)' })
    vim.keymap.set('n', '<leader>fg', function()
      require('telescope.builtin').live_grep({ hidden = true })
    end, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>fb', function()
      require('telescope.builtin').buffers({ hidden = true })
    end, { desc = 'Buffer Search' })
    vim.keymap.set('n', '<leader>fh', function()
      require('telescope.builtin').help_tags({ hidden = true })
    end, { desc = 'Help Tags' })
  end,
}
