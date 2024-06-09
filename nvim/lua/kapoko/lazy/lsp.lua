return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "L3MON4D3/LuaSnip"
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_lsp.default_capabilities()
        local lspconfig = require("lspconfig")

            require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "clangd", "ols" },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities
                    })
                end,
                clangd = function()
                    lspconfig.clangd.setup({
                        capabilities = capabilities,
                        cmd = {
                            "clangd",
                            "-compile-commands-dir=/lsp/clangd"
                        }
                    })
                end,
                lua_ls = function()
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                }
                            }
                        }
                    }
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
                { name = 'nvim_lsp_signature_help' }
            })
        })
    end,
}
