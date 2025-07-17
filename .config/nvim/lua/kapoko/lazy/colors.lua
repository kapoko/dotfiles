return {
    "bluz71/vim-nightfly-colors",
    priority = 1000, -- Ensure it loads first
    config = function()
        vim.cmd.colorscheme "nightfly"
    end
}
