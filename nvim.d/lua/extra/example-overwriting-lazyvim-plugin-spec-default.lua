-- Simple example that shows how to overwrite a LazyVim-installed
-- plugin default property spec ("config.keywords" in below example)

local todo_comments = require("todo-comments")
if todo_comments then
	-- Overwrite keywords parameter
	todo_comments.setup({
		keywords = {
			FIX = { icon = "🔧", color = "error" },
			TODO = { icon = "☑️", color = "hint" },
			NOTE = { icon = "📝", color = "info" }, -- Add a new keyword
		},
	})
end
