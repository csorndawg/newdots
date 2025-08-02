-- Keymaps to replicate basic normal-like actions (motions/deletions)
-- in other Nvim modes

local fn = vim.fn

-- Move backward to just before previous '/' or start of line; fallback to previous word start
local function cmdline_move_to_prev_boundary()
	local line = fn.getcmdline()
	local pos = fn.getcmdpos() -- 1-based

	if pos <= 1 then
		return
	end

	-- look backward for previous '/'
	local head = line:sub(1, pos - 1)
	local slash_pos = head:match(".*()/") -- position of last '/' before cursor
	if slash_pos then
		-- move to just before that slash (i.e., position slash_pos)
		fn.setcmdpos(slash_pos)
		return
	end

	-- fallback: previous word start (like earlier logic)

	-- trim trailing non-word chars
	local trimmed_end = #head
	while trimmed_end > 0 and not head:sub(trimmed_end, trimmed_end):match("[%w_]") do
		trimmed_end = trimmed_end - 1
	end
	if trimmed_end <= 0 then
		fn.setcmdpos(1)
		return
	end
	local trimmed = head:sub(1, trimmed_end)
	local last_start = nil

	for s, _ in trimmed:gmatch("()([%w_]+)") do
		last_start = s
	end
	if last_start then
		fn.setcmdpos(last_start)
	else
		fn.setcmdpos(1)
	end
end

-- Move forward to just after next '/' or end of line; fallback to next word start
local function cmdline_move_to_next_boundary()
	local line = fn.getcmdline()
	local pos = fn.getcmdpos()

	local tail = line:sub(pos)

	-- look for next '/'
	local next_slash_rel = tail:find("/")
	if next_slash_rel then
		-- position after slash
		fn.setcmdpos(pos + next_slash_rel)

		return
	end

	-- fallback: next word start
	-- skip non-word chars
	local skip_end = tail:match("^([^%w_]+)()")
	local offset = 0
	if skip_end then
		offset = #skip_end
		tail = tail:sub(offset + 1)
	end
	local word_start_rel = tail:find("[%w_]+")
	if word_start_rel then
		fn.setcmdpos(pos + offset + word_start_rel - 1)
	else
		fn.setcmdpos(#line + 1)
	end
end

-- Delete backward to just before previous '/' or start of line; fallback to word
local function cmdline_delete_to_prev_boundary()
	local line = fn.getcmdline()
	local pos = fn.getcmdpos()

	if pos <= 1 then
		return
	end
	local head = line:sub(1, pos - 1)
	local tail = line:sub(pos)

	local slash_pos = head:match(".*()/")
	if slash_pos then
		-- delete from slash_pos to cursor (exclusive), cursor ends at slash_pos
		local new_line = line:sub(1, slash_pos - 1) .. tail
		fn.setcmdline(new_line)
		fn.setcmdpos(slash_pos - 1 >= 1 and slash_pos - 1 or 1)
		return
	end

	-- fallback: previous word start
	local trimmed_end = #head
	while trimmed_end > 0 and not head:sub(trimmed_end, trimmed_end):match("[%w_]") do
		trimmed_end = trimmed_end - 1
	end

	if trimmed_end <= 0 then
		fn.setcmdline(tail)
		fn.setcmdpos(1)
		return
	end

	local trimmed = head:sub(1, trimmed_end)
	local last_start = nil
	for s, _ in trimmed:gmatch("()([%w_]+)") do
		last_start = s
	end

	if last_start then
		local new_line = line:sub(1, last_start - 1) .. tail
		fn.setcmdline(new_line)
		fn.setcmdpos(last_start)
	else
		fn.setcmdline(tail)

		fn.setcmdpos(1)
	end
end

-- Delete forward to just after next '/' or EOL; fallback to next word start
local function cmdline_delete_to_next_boundary()
	local line = fn.getcmdline()
	local pos = fn.getcmdpos()
	local tail = line:sub(pos)

	local next_slash_rel = tail:find("/")
	local target_pos
	if next_slash_rel then
		target_pos = pos + next_slash_rel -- position after slash
	else
		-- fallback: skip non-word then word start
		local skip_prefix = tail:match("^([^%w_]+)")
		local offset = skip_prefix and #skip_prefix or 0
		local after = tail:sub(offset + 1)

		local word_rel = after:find("[%w_]+")
		if word_rel then
			target_pos = pos + offset + word_rel - 1
		else
			target_pos = #line + 1
		end
	end

	if target_pos > pos then
		local new_line = line:sub(1, pos - 1) .. line:sub(target_pos)
		fn.setcmdline(new_line)

		fn.setcmdpos(pos)
	end
end

-- Command-line mode mappings updated
vim.keymap.set("c", "<C-j>", function()
	cmdline_move_to_prev_boundary()
end, { noremap = true, silent = true })
vim.keymap.set("c", "<C-k>", function()
	cmdline_move_to_next_boundary()
end, { noremap = true, silent = true })
vim.keymap.set("c", "<C-b>", function()
	cmdline_delete_to_prev_boundary()
end, { noremap = true, silent = true })
vim.keymap.set("c", "<C-f>", function()
	cmdline_delete_to_next_boundary()
end, { noremap = true, silent = true })

-- Insert mode remaps (unchanged)
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true })
vim.keymap.set("i", "<C-j>", "<Up>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Down>", { noremap = true })
vim.keymap.set("i", "<C-S-h>", "<Del>", { noremap = true })
vim.keymap.set("i", "<C-H>", "<Del>", { noremap = true })
vim.keymap.set("i", "<C-L>", "<BS>", { noremap = true })
vim.keymap.set("i", "<C-J>", "<Esc>ddkI", { noremap = true })
vim.keymap.set("i", "<C-S-k>", "<Esc>ddi", { noremap = true })
