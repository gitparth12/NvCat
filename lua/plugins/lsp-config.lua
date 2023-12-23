return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "tsserver", "clangd", "cmake", "cssls", "html" }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.clangd.setup({})
            lspconfig.cmake.setup({})
            lspconfig.cssls.setup({})
            lspconfig.html.setup({})

            local map = require("helpers.keys").map
            map('n', 'K', vim.lsp.buf.hover, {})
            map('n', 'gd', vim.lsp.buf.definition, {})
            map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}
