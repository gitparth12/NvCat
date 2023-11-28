vim.opt.list = true
vim.opt.listchars:append("eol:↴")

-- require("indent_blankline").setup({
--     show_end_of_line = true,
--     show_current_context = true,
-- })
require("ibl").setup({
	indent = {
		char = "|",
		-- highlight = { "Function", "Label" },
		smart_indent_cap = true,
		priority = 2,
	},
	scope = {
		enabled = true,
		show_start = true,
		show_end = true,
		injected_languages = true,
		highlight = { "Function", "Label" },
		priority = 500,
	},
	whitespace = {
		highlight = { "Function", "Label" },
		remove_blankline_trail = true,
	},
})
