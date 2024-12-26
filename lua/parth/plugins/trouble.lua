return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        local map = require("helpers.keys").map
        -- Lua
        map("n", "<leader>tt", function()
            require("trouble").toggle()
        end)
        map("n", "<C-t>", function()
            require("trouble").next({ skip_groups = true, jump = true })
        end)
        map("n", "<C-T>", function()
            require("trouble").previous({ skip_groups = true, jump = true })
        end)
        map("n", "<leader>tw", function()
            require("trouble").toggle("workspace_diagnostics")
        end)
        map("n", "<leader>td", function()
            require("trouble").toggle("document_diagnostics")
        end)
        map("n", "<leader>tq", function()
            require("trouble").toggle("quickfix")
        end)
        map("n", "<leader>tl", function()
            require("trouble").toggle("loclist")
        end)
        map("n", "gR", function()
            require("trouble").toggle("lsp_references")
        end)
    end,
}
