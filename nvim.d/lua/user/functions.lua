-- Core Nvim Custom Functions

--- Case-sensitive grep in current buffer (%)
--- Results are opened in quickfix list
--- @param pattern string The search pattern to use.
local function run_grep_for_buffer(pattern)
	-- Concatenate the Vimscript command string,
	-- including the passed-in pattern and the '%' register for the current file.
	-- The '|' character combines two commands on a single line.

	local cmd = "grep! " .. pattern .. " % | copen"

	-- Execute the command string as Vimscript.
	vim.cmd(cmd)
end
-- Example usage:
-- To search for the word 'function' in the current buffer.
-- run_grep_for_buffer("function")
-- To search for 'local function':
-- run_grep_for_buffer("local function")

-- ripgrep search in current buffer, including unsaved buffer content
-- function RipGrepBuffer(pattern)
-- 	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
-- 	local stdin = table.concat(lines, "\n")
-- 	local cmd = { "rg", "--vimgrep", "--no-heading", "--color=never", pattern, "-" }
-- 	local output = vim.fn.systemlist(cmd, stdin)
-- 	if vim.v.shell_error ~= 0 and #output == 0 then
-- 		print("No matches for: " .. pattern)
-- 		return
-- 	end
-- 	vim.fn.setqflist({}, " ", {
-- 		title = "rg in buffer: " .. pattern,
-- 		lines = output,
-- 	})
-- 	vim.cmd("copen")
-- end

local function RipGrepBuffer(pattern)
	if pattern == "" then
		print("Empty pattern")
		return
	end

	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)

	local stdin = table.concat(lines, "\n")
	local cmd = { "rg", "--vimgrep", "--no-heading", "--color=never", pattern, "-" }
	local output = vim.fn.systemlist(cmd, stdin)

	if vim.v.shell_error ~= 0 and #output == 0 then
		print("No matches for: " .. pattern)
		return
	end

	local qfl_items = {}
	local unparsable = {}

	for _, line in ipairs(output) do
		-- Expected format: -:line:col:match_text
		local parts = vim.split(line, ":", true, 4) -- limit to 4 parts
		if #parts >= 4 and parts[1] == "-" then
			local lnum = tonumber(parts[2])
			local col = tonumber(parts[3])
			local text = parts[4]
			if lnum and col then
				-- For better context, grab the full line from buffer if possible
				local ok, bufline = pcall(vim.api.nvim_buf_get_lines, bufnr, lnum - 1, lnum, false)
				local fulltext = (ok and bufline and bufline[1]) or text
				table.insert(qfl_items, {
					bufnr = bufnr,
					lnum = lnum,
					col = col,
					text = fulltext,
				})
			else
				table.insert(unparsable, line)
			end
		else
			table.insert(unparsable, line)
		end
	end

	if #qfl_items == 0 then
		if #unparsable > 0 then
			print("rg returned lines but none could be parsed; sample:", unparsable[1])
		else
			print("No matches for: " .. pattern)
		end
		return
	end

	vim.fn.setqflist({}, " ", {
		title = "rg in buffer: " .. pattern,
		items = qfl_items,
	})
	vim.cmd("copen")
end

-- register function as Nvim command (for cmdline usage)
vim.api.nvim_create_user_command("RipGrepBuffer", function(opts)
	RipGrepBuffer(opts.args)
end, { nargs = 1 })
