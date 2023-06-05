-- First read our docs (completely) then check the example_config repo

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "solarized_dark",
	statusline = {
		separator_style = "arrow",
	},
}
M.plugins = "custom.plugins"

return M
