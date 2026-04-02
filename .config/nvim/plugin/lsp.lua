Config.now_if_args(function()
    vim.pack.add({
        "https://github.com/mason-org/mason.nvim",
        "https://github.com/mason-org/mason-lspconfig.nvim",
        "https://github.com/neovim/nvim-lspconfig",
        "https://github.com/hrsh7th/nvim-cmp",
        "https://github.com/hrsh7th/cmp-nvim-lsp",
        "https://github.com/hrsh7th/cmp-buffer",
        "https://github.com/hrsh7th/cmp-path",
        "https://github.com/hrsh7th/cmp-cmdline",
        "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
        "https://github.com/L3MON4D3/LuaSnip",
    })

    local cmp = require("cmp")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
    })

    vim.lsp.config("*", {
        capabilities = capabilities,
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
        }, {
            { name = "buffer" },
            { name = "nvim_lsp_signature_help" },
        }),
    })
end)
