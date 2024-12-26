return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        require('todo-comments').setup()
        local map = require("helpers.keys").map
        map("n", "<leader>ft", ':TodoTelescope<CR>', { noremap = true, silent = true })
    end
}
