return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            php = { "phpcbf" },
        },
        formatters = {
            ["phpcbf"] = {
                command = "phpcbf",
                args = {
                    "$FILENAME",
                },
                stdin = false,
            },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        notify_on_error = true,
    },
}
