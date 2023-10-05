local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "Lazy.plugins" },
  { import = "Lazy.plugins.code" },
  { import = "Lazy.plugins.git" },
  { import = "Lazy.plugins.lsp" },
  { import = "Lazy.plugins.ui" },
  { import = "Lazy.plugins.utilities" },
}, {
  install = {
    colorscheme = { "nightfly" },
  },
  checker = {
    enabled = true,
    notify = true,
  },
  change_detection = {
    notify = true,
  },
})
