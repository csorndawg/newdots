-- Filetype Autocmds Only

-- @BROKEN: run lua file from CMD mode remaps dont work, need fix
-- !lua scratch.lua



------------------------------------
--- LUA FT
------------------------------------

-- Create an autocmd group for Lua-specific mappings
local group = vim.api.nvim_create_augroup('LuaMappings', { clear = true })

-- Run the current Lua file
vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = 'lua',
    callback = function()
        -- Normal mode: Run current Lua file w/ <Leader>rl
        vim.keymap.set('n', '<Leader>rl', function()
            vim.cmd('luafile %')
        end, { buffer = true, desc = 'Run current Lua file' })

        -- Visual mode: Run selection with <Leader>rl
        vim.keymap.set('v', '<Leader>rl', function()
            local start_line, start_col, end_line, end_col = unpack(vim.fn.getpos("'<"), 2, 5)
            local lines = vim.fn.getline(start_line, end_line)
            lines[#lines] = string.sub(lines[#lines], 1, end_col)
            lines[1] = string.sub(lines[1], start_col)
            local code = table.concat(lines, '\n')
            local func, err = load(code)
            if func then
                func()
            else
                vim.notify('Error: ' .. err, vim.log.levels.ERROR)
            end
        end, { buffer = true, desc = 'Run Lua code in visual selection' })

        -- Insert mode: Run Lua inline with <Ctrl-x><Ctrl-x>
        vim.keymap.set('i', '<C-x><C-x>', function()
            local input = vim.fn.input('Lua> ')
            local func, err = load(input)
            if func then
                local ok, result = pcall(func)
                if not ok then
                    vim.notify('Error: ' .. result, vim.log.levels.ERROR)
                else
                    vim.notify('Result: ' .. tostring(result), vim.log.levels.INFO)
                end
            else
                vim.notify('Error: ' .. err, vim.log.levels.ERROR)
            end
        end, { buffer = true, desc = 'Run Lua code inline' })
    end,
})

