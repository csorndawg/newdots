-- WHICH-KEY MAPPING DOC EXAMPLE
--

--  local wk = require("which-key")
--  wk.add({
--    { "<leader>f", group = "file" }, -- group
--    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
--    { "<leader>fb", function() print("hello") end, desc = "Foobar" },
--    { "<leader>fn", desc = "New File" },
--    { "<leader>f1", hidden = true }, -- hide this keymap
--  local wk = require("which-key")
--  wk.add({
--    { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
--
--  -- @NESTED MAPPING EXAMPLE
--    { "<leader>b", group = "buffers", expand = function()
--        return require("which-key.extras").expand.buf()
--      end
--    },
--    {
--      -- Nested mappings are allowed and can be added in any order
--      -- Most attributes can be inherited or overridden on any level
--      -- There's no limit to the depth of nesting
--      mode = { "n", "v" }, -- NORMAL and VISUAL mode
--      { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
--      { "<leader>w", "<cmd>w<cr>", desc = "Write" },
--    }
--  })

local wk = require("which-key")

-- LUNARVIM COPYPASTA
--lvim.builtin.which_key.mappings["t"] = {
--wk.add["t"] = {
--	name = "Diagnostics",
--	t = { "<cmd>TroubleToggle<cr>", "trouble" },
--	w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
--	d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
--	q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
--	l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
--	r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
--}

-- @WIP
-- @TODO: Add trouble which-key mappings as nested mapping under <leader>tX where X is a trouble subcommand

wk.add({
	{ "<leader>f", group = "file" }, -- group
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" }, -- group
	-- @FIXME
	--	{
	--		"<leader>d",
	--		group = "debug",
	--		expand = function()
	--			return require("which-key.extras").expand.buf()
	--		end,
	--	},
	{
		"<leader>b",
		group = "buffers",
		expand = function()
			return require("which-key.extras").expand.buf()
		end,
	},
	{
		-- nested mappings are allowed and can be added in any order
		-- most attributes can be inherited or overridden on any level
		-- there's no limit to the depth of nesting
		mode = { "n", "v" }, -- normal and visual mode
		{ "<leader>x", "<cmd>q<cr>", desc = "quit" }, -- no need to specify mode since it's inherited
		{ "<leader><leader>x", "<cmd>q!<cr>", desc = "quit all" }, -- no need to specify mode since it's inherited
		{ "<leader>w", "<cmd>w<cr>", desc = "write" },
	},
})

--
--  -- @nested mapping example
--  { "<leader>b", group = "buffers", expand = function()
--      return require("which-key.extras").expand.buf()
--    end
--  },
--  {
--    -- nested mappings are allowed and can be added in any order
--    -- most attributes can be inherited or overridden on any level
--    -- there's no limit to the depth of nesting
--    mode = { "n", "v" }, -- normal and visual mode
--    { "<leader>q", "<cmd>q<cr>", desc = "quit" }, -- no need to specify mode since it's inherited
--    { "<leader>w", "<cmd>w<cr>", desc = "write" },
--  }
--
--  -- @nested mapping example
--  { "<leader>t", group = "Trouble", expand = function()
--      return require("which-key.extras").expand.buf()
--    end
--  },
--  {
--    name = "Trouble",
--    r = { "<cmd>Trouble lsp_references<cr>", "References" },
--    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--    d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--    w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
--  }
--)
