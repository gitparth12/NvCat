return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        local dark = "#191926"
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
                    -- LineNr = { },
                    NeoTreeNormal = { bg = dark },
                    NeoTreeNormalNC = { bg = dark },
                    ErrorMsg = { bg = dark },
                    MsgArea = { bg = dark },
                }
            end,
        })
    end,
}
