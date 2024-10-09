return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,

  config = function()
    vim.g.catppuccin_flavour = "mocha"
    require("catppuccin").setup({
      transparent_background = true,
      term_colors = false,
      compile = {
        enabled = false,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
      },
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        nvimtree = {
          enabled = true,
          show_root = true,
        },
        telescope = {
          enabled = true,
        },
        treesitter = true,
        notify = true,
      },
    })
    vim.cmd([[colorscheme catppuccin]])
  end,
}
