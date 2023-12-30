return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
        init = function()
            -- Disable automatic setup, we are doing it manually
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_cmp()

            -- And you can configure cmp even more, if you want to.
            local cmp = require("cmp")
            local cmp_action = lsp_zero.cmp_action()
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local cmp_jump = { behavior = cmp.SelectBehavior.Select, count = 4 }

            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    -- ["<C-Space>"] = cmp.mapping.complete(),
                    -- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    -- ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    -- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
                    -- ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                    ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_jump),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_jump),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
            })
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            -- This is where all the LSP shenanigans will live
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
                update_in_insert = true,
            })

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                -- lsp_zero.default_keymaps({ buffer = bufnr })
                local opts = { buffer = bufnr, remap = false }

                -- nmap function
                local nmap = function(keys, func, desc)
                    if desc then
                        desc = "LSP: " .. desc
                    end

                    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
                end

                vim.keymap.set("n", "gd", function()
                    vim.lsp.buf.definition()
                end, opts)
                vim.keymap.set("n", "K", function()
                    vim.lsp.buf.hover()
                end, opts)
                vim.keymap.set("n", "<leader>vws", function()
                    vim.lsp.buf.workspace_symbol()
                end, opts)
                vim.keymap.set("n", "<leader>vd", function()
                    vim.diagnostic.open_float()
                end, opts)
                vim.keymap.set("n", "[d", function()
                    vim.diagnostic.goto_next()
                end, opts)
                vim.keymap.set("n", "]d", function()
                    vim.diagnostic.goto_prev()
                end, opts)
                vim.keymap.set("n", "<leader>vca", function()
                    vim.lsp.buf.code_action()
                end, opts)
                vim.keymap.set("n", "<leader>vrr", function()
                    vim.lsp.buf.references()
                end, opts)
                vim.keymap.set("n", "<leader>vrn", function()
                    vim.lsp.buf.rename()
                end, opts)
                -- vim.keymap.set("i", "<C-h>", function()
                --     vim.lsp.buf.signature_help()
                -- end, opts)
                -- lsp diagnostic cursor hold hover thing, link in set.lua
                vim.api.nvim_create_autocmd("CursorHold", {
                    buffer = bufnr,
                    callback = function()
                        local opts2 = {
                            focusable = false,
                            close_events = { "CursorHoldI", "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                            border = "rounded",
                            source = "always",
                            prefix = " ",
                            scope = "cursor",
                        }
                        vim.diagnostic.open_float(nil, opts2)
                    end,
                })
                -- See `:help K` for why this keymap
                nmap("K", vim.lsp.buf.hover, "Hover Documentation")
                -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
            end)

            require("mason-lspconfig").setup({
                ensure_installed = {},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        -- (Optional) Configure lua language server for neovim
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                },
            })
        end,
    },
}
-- return {
--     {
--         "VonHeikemen/lsp-zero.nvim",
--         branch = "v3.x",
--     },
--     {
--         "williamboman/mason.nvim",
--         config = function()
--             require("mason").setup({})
--         end,
--     },
--     {
--         "williamboman/mason-lspconfig.nvim",
--         config = function()
--             require("mason-lspconfig").setup({
--                 -- ensure_installed = { "lua_ls", "tsserver", "clangd", "cmake", "cssls", "html", "pyright" }
--                 auto_installed = true,
--             })
--         end,
--     },
--     {
--         "neovim/nvim-lspconfig",
--         config = function()
--             local lspconfig = require("lspconfig")
--             lspconfig.lua_ls.setup({})
--             lspconfig.tsserver.setup({})
--             lspconfig.clangd.setup({
--                 -- cmd = {"/usr/bin/clangd", "--tab-width=4"},
--                 -- root_dir = lspconfig.util.root_pattern('.git');
--             })
--             lspconfig.cmake.setup({})
--             lspconfig.cssls.setup({})
--             lspconfig.html.setup({})
--
--             local map = require("helpers.keys").map
--             map("n", "K", vim.lsp.buf.hover, {})
--             map("n", "gd", vim.lsp.buf.definition, {})
--             map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
--         end,
--     },
-- }
