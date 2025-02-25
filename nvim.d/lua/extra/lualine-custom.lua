-- Lualine configuration
local M = {}

M.setup = function()
	local lualine = require("lualine")

	-- Get the current config (to avoid overwriting everything)
	local config = {
		options = {
			theme = "nord",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
			icons_enabled = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff","diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress", "location", "hostname" },
			lualine_z = { "location" },
		},
		inactive_sections = {
		-- lualine_a = {},
		-- lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		-- lualine_y = {},
		-- lualine_z = {},
		-- },
		--		tabline = {},
		--		winbar = {},
		--		inactive_winbar = {},
		--		extensions = {},
  },
	}

	-- Apply the new configuration (merging it with the defaults)
	lualine.setup(config)
end

return M
