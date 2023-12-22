return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
        -- recent files plugin
        {"smartpde/telescope-recent-files"}
    },
    config = function()
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key"
                    }
                }
            },
            pickers = {},
            extensions = {},
        })
        -- Enable telescope fzf native, if installed
        pcall(require("telescope").load_extension, "fzf")
        -- Enable recent files extension, if installed
        pcall(require("telescope").load_extension, "recent_files")

        local map = require("helpers.keys").map
        map("n", "<leader>fr", require('telescope').extensions.recent_files.pick, "Recently opened")
        -- map("n", "<leader><space>", require("telescope.builtin").buffers, "Open buffers")
        map("n", "<leader>/", function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, "Search in current buffer")

        map("n", "<leader>ff", require("telescope.builtin").find_files, "Files")
        map("n", "<leader>fh", require("telescope.builtin").help_tags, "Help")
        map("n", "<leader>fw", require("telescope.builtin").grep_string, "Current word")
        map("n", "<leader>fg", require("telescope.builtin").live_grep, "Grep")
        map("n", "<leader>fd", require("telescope.builtin").diagnostics, "Diagnostics")

        map("n", "<C-p>", require("telescope.builtin").keymaps, "Search keymaps")
    end,
}
