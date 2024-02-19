local M = {}
function M.opts(_, opts)
	local source_mapping = {
		buffer = "[Buf]",
		nvim_lsp = "[LSP]",
		nvim_lua = "[Lua]",
		cmp_tabnine = "[TN]",
		path = "[Path]",
	}
	local present, compare = pcall(require, "cmp.config.compare")
	if not present then
		return {}
	end

	opts.formatting = {
		format = function(entry, vim_item)
			local icons = require("nvchad.icons.lspkind")
			vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
			vim_item.menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				local detail = (entry.completion_item.data or {}).detail
				vim_item.kind = " "
				if detail and detail:find(".*%%.*") then
					vim_item.kind = vim_item.kind .. " " .. detail
				end

				if (entry.completion_item.data or {}).multiline then
					vim_item.kind = vim_item.kind .. " " .. "[ML]"
				end
			end
			local maxwidth = 80
			vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
			return vim_item
		end,
	}
	opts.sorting = {
		priority_weight = 2,
		comparators = {
			require("cmp_tabnine.compare"),
			compare.offset,
			compare.exact,
			compare.score,
			compare.recently_used,
			compare.kind,
			compare.sort_text,
			compare.length,
			compare.order,
		},
	}
	opts.sources = {
		{ name = "cmp_tabnine" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	}
end

return M
