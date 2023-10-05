return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    nvimtree.setup({
      sort_by = "case_sensitive",
      view = {
        side = "right",
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    })
    local wk = require("which-key")
    wk.register({
      e = {
        name = "nvim-tree",
        e = { "<cmd>NvimTreeToggle<CR>", "Toggle file explorer" },
        f = { "<cmd>NvimTreeFindFileToggle<CR>", "Toggle file explorer on current file" },
        c = { "<cmd>NvimTreeCollapse<CR>", "Collapse file explorer" },
        r = { "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer" },
      },
    }, { prefix = "<leader>" })
  end,
}
