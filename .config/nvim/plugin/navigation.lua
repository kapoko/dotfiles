vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/mbbill/undotree",
    "https://github.com/christoomey/vim-tmux-navigator",
}, {
    confirm = false,
    load = true,
})

require("telescope").setup({
    pickers = {
        find_files = {
            hidden = true,
            find_command = {
                "rg",
                "--files",
                "--hidden",
                "--glob=!**/.git",
                "--glob=!**/build/*",
                "--glob=!**/dist/*",
            },
        },
    },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
vim.keymap.set("n", "<leader>pa", function()
    builtin.find_files({
        prompt_title = "All Files",
        hidden = true,
        no_ignore = true,
        no_ignore_parent = true,
    })
end)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>")
