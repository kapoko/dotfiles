Config.now_if_args(function()
    local ts_update = function() vim.cmd('TSUpdate') end
    Config.on_packchanged('nvim-treesitter', { 'update' }, ts_update, ':TSUpdate')

    vim.pack.add({
        "https://github.com/windwp/nvim-autopairs",
        "https://github.com/nvim-treesitter/nvim-treesitter",
    })

    require("nvim-autopairs").setup()
    require("nvim-treesitter").setup({
        ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "javascript",
            "typescript",
            "bash",
            "php",
            "glsl",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    })
end)

Config.later(function()
    vim.pack.add({
        "https://github.com/stevearc/conform.nvim",
    })

    require("conform").setup({
        formatters_by_ft = {
            php = { "phpcbf" },
            scss = { "prettier" },
            sass = { "prettier" },
            css = { "prettier" },
            typescript = { "biome" },
            javascript = { "biome" },
            typescriptreact = { "biome" },
            javascriptreact = { "biome" },
            json = { "biome" },
            jsonc = { "biome" },
        },
        formatters = {
            phpcbf = {
                command = "phpcbf",
                args = {
                    "--standard=PSR12",
                    "$FILENAME",
                },
                stdin = false,
            },
            prettier = {
                command = "prettier",
                args = { "--stdin-filepath", "$FILENAME" },
            },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        notify_on_error = true,
    })
end)
