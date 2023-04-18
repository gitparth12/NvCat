local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		-- null_ls.builtins.formatting.deno_fmt, -- will use the source for all supported file types
		-- null_ls.builtins.formatting.deno_fmt.with({
		--	filetypes = { "markdown" }, -- only runs `deno fmt` for markdown
		-- }),
		null_ls.builtins.formatting.isort,
	},
})
