return {
    "bluz71/vim-nightfly-colors",
    priority = 1000, -- Ensure it loads first
    config = function()
        require("nightfly").custom_colors({
            bg = "#0d1721",
        })
        vim.cmd([[colorscheme nightfly]])
    end
}
