return {
    -- {
    --     "feline-nvim/feline.nvim",
    --     config = function()
    --         local ctp_feline = require("catppuccin.groups.integrations.feline")
    --         local statusline_overrides = {
    --             { filetype = "^Neotree$", statusline = " " },
    --             -- { filetype = "^fern$",  statusline = minimal_statusline },
    --             -- { filetype = "^startify$", statusline = startify_statusline },
    --             -- { filetype = "^Telescope$", statusline = file_finder_statusline },
    --         }
    --         require("feline").setup({
    --             components = ctp_feline.get(),
    --             statusline_overrides = statusline_overrides,
    --         })
    --     end
    -- },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'dracula'
                }
            })
        end
    },
}
