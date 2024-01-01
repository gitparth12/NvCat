return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup {
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
                        -- NeoTreeBufferNumber = { bg = "#1e1e2e" },
                        -- NeoTreeCursorLine = { bg = "#1e1e2e" },
                        -- NeoTreeDimText = { bg = "#1e1e2e" },
                        -- NeoTreeDirectoryIcon = { bg = "#1e1e2e" },
                        -- NeoTreeDirectoryName = { bg = "#1e1e2e" },
                        -- NeoTreeDotfile = { bg = "#1e1e2e" },
                        -- NeoTreeFileIcon = { bg = "#1e1e2e" },
                        -- NeoTreeFileName = { bg = "#1e1e2e" },
                        -- NeoTreeFileNameOpened = { bg = "#1e1e2e" },
                        -- NeoTreeFilterTerm = { bg = "#1e1e2e" },
                        -- NeoTreeFloatBorder = { bg = "#1e1e2e" },
                        -- NeoTreeFloatTitle = { bg = "#1e1e2e" },
                        --
                        -- NeoTreeTitleBar = { bg = "#1e1e2e" },
                        --
                        -- NeoTreeGitAdded = { bg = "#1e1e2e" },
                        -- NeoTreeGitConflict = { bg = "#1e1e2e" },
                        -- NeoTreeGitDeleted = { bg = "#1e1e2e" },
                        -- NeoTreeGitIgnored = { bg = "#1e1e2e" },
                        -- NeoTreeGitModified = { bg = "#1e1e2e" },
                        -- NeoTreeGitUnstaged = { bg = "#1e1e2e" },
                        -- NeoTreeGitUntracked = { bg = "#1e1e2e" },
                        -- NeoTreeGitStaged = { bg = "#1e1e2e" },
                        -- NeoTreeHiddenByName = { bg = "#1e1e2e" },
                        -- NeoTreeIndentMarker = { bg = "#1e1e2e" },
                        -- NeoTreeExpander = { bg = "#1e1e2e" },
                        -- NeoTreeSignColumn = { bg = "#1e1e2e" },
                        -- NeoTreeStats = { bg = "#1e1e2e" },
                        -- NeoTreeStatsHeader = { bg = "#1e1e2e" },
                        -- NeoTreeStatusLine = { bg = "#1e1e2e" },
                        -- NeoTreeStatusLineNC = { bg = "#1e1e2e" },
                        -- NeoTreeVertSplit = { bg = "#1e1e2e" },
                        -- NeoTreeWinSeparator = { bg = "#1e1e2e" },
                        -- NeoTreeEndOfBuffer = { bg = "#1e1e2e" },
                        -- NeoTreeRootName = { bg = "#1e1e2e" },
                        -- NeoTreeSymbolicLinkTarget = { bg = "#1e1e2e" },
                        --
                        -- NeoTreeWindowsHidden = { bg = "#1e1e2e" },
                    }
                end
            }
        end
    },
    -- { "miikanissi/modus-themes.nvim", priority = 1000 }
}
