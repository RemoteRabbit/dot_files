vim.opt.termguicolors = true

vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]

require('nvim-tree').setup()

vim.keymap.set('n', '<C-n>', vim.cmd.NvimTreeFindFileToggle)
