Config.now(function()
    vim.pack.add({
        "https://github.com/bluz71/vim-nightfly-colors",
        "https://github.com/nvim-lualine/lualine.nvim",
        "https://github.com/nvim-tree/nvim-web-devicons",
    })

    require("nightfly").custom_colors({
        bg = "#0d1721",
    })
    vim.cmd([[colorscheme nightfly]])

    require("lualine").setup()
end)
