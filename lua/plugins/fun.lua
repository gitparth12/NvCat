return {
    {
        "eandrju/cellular-automaton.nvim",
        config = function()
            local map = require("helpers.keys").map
            map("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
        end,
    },
}
