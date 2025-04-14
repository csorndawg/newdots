-- telescope-luasnip.lua config

local wk = require("which-key") -- optional, if you're using which-key
local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

telescope.setup({
	extensions = {
		luasnip = {
			-- optional config
		},
	},
})

-- function to handle multiple snippet selections

local function multi_select_luasnip()
	require("telescope.pickers")
		.new(
			{},
			require("telescope.themes").get_dropdown({
				prompt_title = "Snippets",
				finder = require("telescope.finders").new_table({
					results = require("luasnip").available(),
					entry_maker = function(entry)
						return {
							value = entry,
							display = entry.name or "Unnamed",

							ordinal = entry.name or "Unnamed",
						}
					end,
				}),
				sorter = require("telescope.config").values.generic_sorter({}),
				attach_mappings = function(prompt_bufnr, map)
					local function multi_send()
						local picker = action_state.get_current_picker(prompt_bufnr)
						local selections = picker:get_multi_selection()

						for _, entry in ipairs(selections) do
							vim.cmd("stopinsert") -- leave insert mode
							require("luasnip").snip_expand(entry.value)
						end
						actions.close(prompt_bufnr)
					end

					map("i", "<CR>", multi_send)
					map("n", "<CR>", multi_send)
					return true
				end,
			})
		)
		:find()
end

-- keymap: <leader>Tl
vim.keymap.set("n", "<leader>Tl", multi_select_luasnip, { desc = "LuaSnip Ext." })

-- or if you prefer a simpler version:
-- vim.keymap.set("n", "<leader>Tl", ":lua require('telescope').extensions.luasnip.luasnip{}<CR>", { desc = "LuaSnip Telescope" })
