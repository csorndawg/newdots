-- Unable to get any other Swenv functions, beside the one used in the below keymap, to work
-- Created a custom module ("my_teledir_picker") to replicate the functionality for the
-- broken functions like pick_venv().
--
-- Even though its just a single keymap/function DO NOT DELETE THIS FUNCTION.
-- It still is useful for my workflow, and is used alongside my custom module.

vim.keymap.set("n", "<Leader>cvv", function()
	local venv = require("swenv.api").set_venv()
	vim.notify("Current venv: " .. (venv or "No active venv"), vim.log.levels.INFO)
end, { desc = "View current venv", noremap = true })
