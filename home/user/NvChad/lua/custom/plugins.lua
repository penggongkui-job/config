local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
return {
	{
		"Vimjas/vim-python-pep8-indent",
		ft = "python",
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = "lsp-format.nvim",
		lazy = false,
		opts = require("custom.configs.null-ls").opts,
	},
	{
		"lukas-reineke/lsp-format.nvim",
		opts = {
			python = {
				exclude = { "pyright" },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "lsp-format.nvim" },
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		event = "VimEnter",
		opts = overrides.nvimtree,
	},
	{
		"tpope/vim-fugitive",
		cmd = { "G", "Git" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"tzachar/cmp-tabnine",
		build = "./install.sh",
		opts = overrides.tabline,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = "cmp-tabnine",
		opts = require("custom.configs.cmp").opts,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
	},
}
