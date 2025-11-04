return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            php = { "phpcbf" },
            scss = { "prettier" },
            sass = { "prettier" },
            css = { "prettier" },
        },
        formatters = {
            ["phpcbf"] = {
                command = "phpcbf",
                args = {
                    "--standard=PSR12",
                    "$FILENAME",
                },
                stdin = false,
            },
            ["prettier"] = {
                command = "prettier",
                args = { "--stdin-filepath", "$FILENAME" },
            },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        notify_on_error = true,
    },
}
