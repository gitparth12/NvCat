-- Setting keymap for accepting suggestions
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""
-- vim.g.copilot_suggest_on_enter = true

vim.g.copilot_filetypes = {
	["*"] = false,
	-- ["javascript"] = true,
	-- ["typescript"] = true,
	-- ["lua"] = false,
	-- ["rust"] = true,
	-- ["c"] = true,
	-- ["c#"] = true,
	-- ["c++"] = true,
	-- ["go"] = true,
	-- ["python"] = true,
}

-- Suggestions window
vim.cmd([[highlight CopilotSuggestion guifg=#555555 ctermbg=8]])

