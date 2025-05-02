-- @TEMP: temporary keymap for testing snacks install/config

-- test basic input (no prompt/no selections)
vim.keymap.set("n", "<leader>si", function()
	vim.ui.input({ prompt = "Test Snack Input:" }, function(input)
		if input then
			vim.notify("You entered: " .. input)
		end
	end)
end, { desc = "Test Snack Input" })

-- test input with selection options
vim.keymap.set("n", "<leader>ss", function()
	vim.ui.select({ "Option 1", "Option 2", "Option 3" }, { prompt = "Test Snack Select:" }, function(choice)
		if choice then
			vim.notify("You selected: " .. choice)
		else
			vim.notify("No option selected")
		end
	end)
end, { desc = "Test Snack Select" })
