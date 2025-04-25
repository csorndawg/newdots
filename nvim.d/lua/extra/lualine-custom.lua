-- Lualine configuration
local M = {}

-- local Lua function needed for add Swenv info to lualine, for python files only
local function is_python_file()
	return vim.bo.filetype == "python"
end

-- helper function for trimming Venv path to its basename
local function get_venv_name()
	local venv = require("swenv.api").get_current_venv()
	if not venv then
		return ""
	end
	local lualine_venv = vim.fn.fnamemodify(venv.name, ":t") -- gets tail (basename) of venv variable (venv path)
	return string.format("(%s)", lualine_venv) -- wraps venv name in parentheses `()` in lualine
end

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
		-- "a" is leftmost section on lualine
		-- "z" is rightmost section on lualine
		sections = {
			lualine_a = {
				{
					"mode",
				},
			},
			lualine_b = { "branch", "diff" },
			lualine_c = {
				"diagnostics", --@NOTE: leaning towards dropping component
				-- add SWENV info to lualine for python filetypes
				{
					get_venv_name, -- @IMPORTANT: notice how parentheses `()` are not used when referencing functions defined within same file
					cond = is_python_file,
					color = {
						--bg = "#5E81AC",
						fg = "#B48EAD", -- nord magenta
						gui = "italic",
						--bg = "#ECEFF4",
						-- gui = "bold",
					}, -- Nord theme colors
				},
			},
			lualine_x = { "filetype" },
			lualine_y = { "progress", "location" },
			lualine_z = {
				"filename",
			},
		},
		inactive_sections = {
			-- lualine_a = {},
			-- lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "fileformat", "encoding", "location" },
			lualine_y = { "hostname" }, -- @verify: this is dropped from lualine
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
