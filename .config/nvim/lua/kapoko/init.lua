require("kapoko.set")
require("kapoko.remap")
require("kapoko.lazy_init")

vim.api.nvim_exec([[
      augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.lua,*.odin,*.c,*.json,*.ts,*.tsx,*.js,*.css lua vim.lsp.buf.format()
      augroup END
    ]], true)
