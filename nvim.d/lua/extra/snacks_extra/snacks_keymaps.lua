-- lua/extra/snacks-keymaps.lua
local snacks = require("snacks")

vim.keymap.set("n", "<leader>si", function()
	snacks.input("Enter something:", {
		default = "default text",
	}, function(input)
		if input then
			vim.notify("You entered: " .. input)
		end
	end)
end, { desc = "Snacks: Input prompt" })

vim.keymap.set("n", "<leader>Sn", function()
	snacks.notify("This is a snacks notification!", "info", { title = "Notifier" })
end, { desc = "Snacks: Show notification" })

vim.keymap.set("n", "<leader>St", function()
	snacks.terminal("htop", { close_on_exit = false })
end, { desc = "Snacks: Open terminal (htop)" })

vim.keymap.set("n", "<leader>Ss", function()
	snacks.scratch({ title = "Scratch Buffer", filetype = "markdown" })
end, { desc = "Snacks: Open scratch buffer" })

vim.keymap.set("n", "<leader>Sp", function()
	snacks.picker("command", {
		title = "Run Command",
		values = {
			{ label = "Top", value = "top" },
			{ label = "Date", value = "date" },
		},
		on_select = function(item)
			vim.notify("Selected: " .. item.value)
		end,
	})
end, { desc = "Snacks: Picker menu" })
