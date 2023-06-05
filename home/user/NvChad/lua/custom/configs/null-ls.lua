local M = {}

function M.opts()
	local b = require("null-ls").builtins

	return {
		debug = true,
		on_attach = require("lsp-format").on_attach,
		sources = {
			-- python
			b.formatting.black.with({
				args = { "--quiet", "-" },
			}),
			b.formatting.isort.with({
				args = { "--profile", "black", "--stdout", "-" },
			}),

			-- go
			b.formatting.goimports,

			-- Lua
			b.formatting.stylua,

			-- Shell
			b.formatting.shfmt.with({
				args = { "-i", "2", "-ci", "-bn", "-filename", "$FILENAME" },
			}),
			b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

			-- ts
			b.formatting.prettierd,
		},
	}
end

return M
