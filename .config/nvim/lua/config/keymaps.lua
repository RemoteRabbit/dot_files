-- General Purpose
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", {desc = "Jump back"})
vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "Print without losing the register"})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Swap with next line down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Swap with next line above"})
vim.keymap.set("n", "J", "mzJ`z", {desc = "Delete newline at end of current line"})
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], {desc = "Single char deletion"})
vim.keymap.set("i", "<C-c>", "<Esc>", {desc = "Exit (mainly when not with kenisis)"})
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {desc = "Format pls"})
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "find and replace"})
vim.keymap.set("n", "<leader><leader>", ":source %<CR>", {desc = "source current file"})

-- Harpoon 
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, {desc = "Add to harpoon"})
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc = "Open harpoon menu"})

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, {desc = "File 1 in harpoon"})
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end, {desc = "File 2 in harpoon"})
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end, {desc = "File 3 in harpoon"})
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end, {desc = "File 4 in harpoon"})

-- Undotree
vim.keymap.set("n", "<leader>cu", vim.cmd.UndotreeToggle, {desc = "Show Undotree"})

-- Zen Mode
vim.keymap.set("n", "<leader>zm", vim.cmd.ZenMode, {desc = "Enter/exit ZenMode"})
