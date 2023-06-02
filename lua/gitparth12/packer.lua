-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- use({
	-- 	'rose-pine/neovim',
	-- 	as = 'rose-pine',
	-- 	config = function()
	-- 		vim.cmd('colorscheme rose-pine')
	-- 	end
	-- })

	-- use({
	--     'folke/tokyonight.nvim',
	--     as = 'tokyonight',
	--     config = function()
	--         vim.cmd('colorscheme tokyonight-moon')
	--     end
	-- })

	use({ "catppuccin/nvim" })

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})
	use({ "github/copilot.vim" })

	use({ "jose-elias-alvarez/null-ls.nvim" })

	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})

	use({ "feline-nvim/feline.nvim" })

	use({ "nvim-tree/nvim-web-devicons" })

	use({ "nvim-treesitter/nvim-treesitter-context" })

	use({ "tpope/vim-commentary" })

	use({ "tpope/vim-surround" })

	use({ "lukas-reineke/indent-blankline.nvim" })

	use({
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
	})
end)
