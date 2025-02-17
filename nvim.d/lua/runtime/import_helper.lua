local M = {}

M.import_custom_luasnips = function()
	local loosnips_path = vim.fn.stdpath("config") .. "/lua/extra/loosnips"
	local prefix = "extra.loosnips."

	local scan = vim.loop.fs_scandir(loosnips_path)
	if not scan then
		vim.notify("Loosnips folder not found!", vim.log.levels.ERROR)
		return
	end

	while true do
		local file, _ = vim.loop.fs_scandir_next(scan)
		if not file then
			break
		end

		--if file:match("%custom.lua$") then
		if file:match("%.lua$") then
			local module_name = file:gsub("%.lua$", "") -- Remove .lua extension
			local require_path = prefix .. module_name
			local ok, err = pcall(require, require_path)
			if not ok then
				vim.notify("Error loading module: " .. require_path .. "\n" .. err, vim.log.levels.ERROR)
				-- else
				-- 	vim.notify("Loaded: " .. require_path, vim.log.levels.INFO)
			end
		end
	end
end

return M
