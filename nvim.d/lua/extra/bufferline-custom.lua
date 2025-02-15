-- Bufferline Configurations
local M = {}

M.setup = function()
	local bufferline = require("bufferline")

	-- Enable true color support
	--vim.opt.termguicolors = true

	-- Define custom configuration (overwrites default settings)
	local bufferline_config = {
		options = {
			numbers = "buffer_id",
			separator_style = "thin",
			diagnostics = "nvim_lsp",
			numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			max_name_length = 30,
			max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
			tab_size = 21,
			diagnostics = false, -- | "nvim_lsp" | "coc",
			diagnostics_update_in_insert = false,
			enforce_regular_tabs = true,
			always_show_bufferline = true,
		},
		highlights = {
			--fill = { bg = "#4c566a" },
			fill = { bg = "#667084" },
			buffer_selected = {
				bold = true,
				fg = "#5e81ac",
			},
			diagnostic_selected = { bold = true },
			info_selected = { bold = true },
			info_diagnostic_selected = { bold = true },
			warning_selected = { bold = true },
			warning_diagnostic_selected = { bold = true },
			error_selected = { bold = true },
			error_diagnostic_selected = { bold = true },
		},
	}

	-- Apply the new configuration
	bufferline.setup(bufferline_config)
end
return M
