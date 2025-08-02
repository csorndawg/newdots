-- Keymaps to replicate basic normal-like actions (motions/deletions)
-- in other Nvim modes
local api = vim.api
local fn = vim.fn

-- Helpers for cmdline mode: emulate 'w' and 'b' and their delete variants.
local function cmdline_move_to_next_word()
	local line = fn.getcmdline()
	local pos = fn.getcmdpos() -- 1-based
	-- Search for next word start like normal-mode 'w'

	-- Pattern: skip current word/chars then find start of next keyword-word or non-blank sequence
	local tail = line:sub(pos)
	local _, next_start = tail:find("[%w_]+") -- first word in tail
	if next_start then
		-- If we're already on a word start, advance to the following word
		local after = tail:sub(next_start + 1)
		local _, following = after:find("[%w_]+")
		if following then
			-- move to that start
			fn.setcmdpos(pos + next_start + following)
		else
			-- fallback: move to end of tail
			fn.setcmdpos(#line + 1)
		end
	else
		-- no word ahead: move to end
		fn.setcmdpos(#line + 1)
	end
end

local function cmdline_move_to_prev_word()
	local line = fn.getcmdline()
	local pos = fn.getcmdpos()
	if pos <= 1 then
		return
	end
	local head = line:sub(1, pos - 1)
	-- Find last word start before cursor (like 'b')
	-- Reverse search: find all word starts, pick the last one before current
	local last_start = nil
	for s, _ in head:gmatch("()([%w_]+)") do
		last_start = s
	end
	if last_start then
		fn.setcmdpos(last_start)
	else
		-- fallback to beginning
		fn.setcmdpos(1)
	end
end

local function cmdline_delete_to_next_word()
	local line = fn.getcmdline()
	local pos = fn.getcmdpos()
	-- Compute target position using move_to_next_word logic, then delete from pos to that
	local original_pos = pos
	-- Temporarily get the target
	local target_pos
	do
		local tail = line:sub(pos)
		local _, next_start = tail:find("[%w_]+")

		if next_start then
			local after = tail:sub(next_start + 1)
			local _, following = after:find("[%w_]+")
			if following then
				target_pos = pos + next_start + following
			else
				target_pos = #line + 1
			end
		else
			target_pos = #line + 1
		end
	end
	if target_pos > original_pos then
		-- delete substring
		local new_line = line:sub(1, original_pos - 1) .. line:sub(target_pos)
		-- set cmdline and cursor

		fn.setcmdline(new_line)
		fn.setcmdpos(original_pos)
	end
end

local function cmdline_delete_to_prev_word()
	local line = fn.getcmdline()
	local pos = fn.getcmdpos()
	if pos <= 1 then
		return
	end

	local head = line:sub(1, pos - 1)
	local last_start = nil
	for s, _ in head:gmatch("()([%w_]+)") do
		last_start = s
	end
	local new_line
	local new_pos
	if last_start and last_start < pos then
		new_line = line:sub(1, last_start - 1) .. line:sub(pos)
		new_pos = last_start
	else
		-- delete to beginning
		new_line = line:sub(pos)
		new_pos = 1
	end
	fn.setcmdline(new_line)
	fn.setcmdpos(new_pos)
end

-- Map in command-line mode
vim.keymap.set("c", "<C-j>", function()
	cmdline_move_to_next_word()
end, { noremap = true, silent = true })
vim.keymap.set("c", "<C-k>", function()
	cmdline_move_to_prev_word()
end, { noremap = true, silent = true })

vim.keymap.set("c", "<C-f>", function()
	cmdline_delete_to_next_word()
end, { noremap = true, silent = true })
vim.keymap.set("c", "<C-b>", function()
	cmdline_delete_to_prev_word()
end, { noremap = true, silent = true })

-- Insert mode remaps
-- Cursor movements
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true })

vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true })

vim.keymap.set("i", "<C-j>", "<Up>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Down>", { noremap = true })

-- <C-S-h> as Delete: depending on terminal, might come through as <C-H> or needs term adjustment.
-- We'll map both common variants.
vim.keymap.set("i", "<C-S-h>", "<Del>", { noremap = true })
vim.keymap.set("i", "<C-H>", "<Del>", { noremap = true })

-- <C-L> as Backspace (note uppercase L)
vim.keymap.set("i", "<C-L>", "<BS>", { noremap = true })

-- <C-J>: delete current line and move cursor up one, then enter insert mode

vim.keymap.set("i", "<C-J>", "<Esc>ddkI", { noremap = true })

-- <C-S-k>: delete current line (stay in insert at current line start)
vim.keymap.set("i", "<C-S-k>", "<Esc>ddi", { noremap = true })
