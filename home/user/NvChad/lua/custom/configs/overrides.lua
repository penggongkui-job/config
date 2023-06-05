local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"go",
		"markdown",
		"markdown_inline",
	},
	indent = {
		enable = true,
		disable = {
			"python",
		},
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- shell
		"shfmt",
		"shellcheck",

		--python
		"pyright",
		"black",
		"isort",

		-- go
		"gopls",
		"goimports",

		-- js/ts/tsx
		"typescript-language-server",
		"eslint-lsp",
		"prettierd",
		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"deno",

		"json-lsp",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		symlink_destination = false,
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},

	filters = {
		dotfiles = true,
		custom = { "__pycache__" },
	},

	live_filter = {
		always_show_folders = false,
	},
}

M.tabline = {
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
	ignored_file_types = {
		-- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	},
	show_prediction_strength = true,
}

M.telescope = {
	defaults = {
		-- iterm2 3.4 can't render defaults icon \uf002
		prompt_prefix = "   ",
	},
}
return M
