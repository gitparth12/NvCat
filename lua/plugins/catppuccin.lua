return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            color_overrides = {
                all = {
                    text = "#ffffff",
                },
                mocha = {
                    base = "#1e1e2e",
                },
                frappe = {},
                macchiato = {},
                latte = {},
            },
            custom_highlights = function(colors)
                return {
                    NeoTreeNormal = { bg = "#191926" },
                    NeoTreeNormalNC = { bg = "#191926" },
                }
            end,
        })
    end,
}
