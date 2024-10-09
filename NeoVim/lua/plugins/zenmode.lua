return {
  "folke/zen-mode.nvim",
  opts = {
  },
  config = function()
    -- local zen = require("zen-mode.nvim")
    vim.keymap.set("n", "<leader>zm", require("zen-mode").toggle, { desc = "Toggle Zen Mode" })
  end,
}
