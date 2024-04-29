require("kapoko.set")
require("kapoko.remap")
require("kapoko.lazy_init")

-- Automatically format on save
vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.lua,*.md,*.markdown,*.odin,*.c lua vim.lsp.buf.format()
  augroup END
]], true)

