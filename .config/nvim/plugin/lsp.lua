vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/hrsh7th/cmp-cmdline",
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
    "https://github.com/L3MON4D3/LuaSnip",
}, {
    confirm = false,
    load = true,
})

local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_lsp.default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" },
    handlers = {
        function() end,
    },
})

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = {
        "clangd",
        "-compile-commands-dir=/lsp/clangd",
    },
})

vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
    end,
    root_markers = { "tsconfig.json", "package.json", "jsconfig.json" },
    single_file_support = false,
})

vim.lsp.config("phpactor", {
    capabilities = capabilities,
    root_markers = { "vendor" },
})

vim.lsp.config("biome", {
    capabilities = capabilities,
    root_markers = { "biome.json" },
    single_file_support = false,
})

vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("phpactor")
vim.lsp.enable("biome")

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
