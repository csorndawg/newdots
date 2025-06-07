-- LSP related custom utils

local M = {}

--- Convert mason package names to valid lspconfig names
--- by filtering only those that are valid `lspconfig` configs
function M.filter_lspconfig_servers(mason_list)
	local available = require("lspconfig.util").available_servers() or {}
	local servers = {}

	-- Build a quick set of valid lspconfig server names
	local valid = {}
	for _, name in ipairs(available) do
		valid[name] = true
	end

	-- Filter only mason packages that match valid lspconfig names
	for _, name in ipairs(mason_list) do
		-- try mason name directly
		if valid[name] then
			table.insert(servers, name)
		else
			-- try replacing "-" with ""
			local alt = name:gsub("-", "")
			if valid[alt] then
				table.insert(servers, alt)
			end
		end
	end

	return servers
end

return M
