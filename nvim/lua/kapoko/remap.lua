vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>");
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>");
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>");
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>");
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>");
