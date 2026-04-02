vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
