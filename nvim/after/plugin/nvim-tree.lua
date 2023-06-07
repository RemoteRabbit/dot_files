require('nvim-tree').setup()

vim.keymap.set('n', '<C-n>', vim.cmd.NvimTreeFindFileToggle)
