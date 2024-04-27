vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

-- Automatically format on save
vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.lua,*.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.md,*.markdown,*.json,*.yaml,*.yml,*.html,*.odin,*.c lua vim.lsp.buf.format()
  augroup END
]], true)
