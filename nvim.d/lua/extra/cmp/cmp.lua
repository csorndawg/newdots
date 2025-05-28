------------------------
-- NVIM-CMP
------------------------

local cmp = require("cmp")
local cmp_under_comparator = require("cmp-under-comparator")
local luasnip = require("luasnip")

-- better autocompletion experience
vim.o.completeopt = "menuone,noselect"

cmp.setup({
	-- Format the autocomplete menu
	-- formatting = {
	--		format = llspkind.luaspkind.cmp_format()
	--	},

	-- configure cmp popup menu
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		-- Use Tab and shift-Tab to navigate autocomplete menu
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,

		-- smart safe <Enter> accept CMP suggestion
		["<CR>"] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() and cmp.get_active_entry() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
				else
					fallback()
				end
			end,
			s = cmp.mapping.confirm({ select = true }),
			c = function(fallback)
				if cmp.visible() and cmp.get_active_entry() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
				else
					-- Perform % fix only in cmdline mode
					local mode = vim.api.nvim_get_mode().mode
					if mode == "c" then
						local line = vim.fn.getcmdline()
						local col = vim.fn.getcmdpos()
						local prefix = string.sub(line, 1, col - 1)
						local suffix = string.sub(line, col)

						-- Match '%' followed by any path-like string (letters, numbers, symbols, dots, slashes, underscores, etc.)
						local new_prefix = prefix:gsub("%%([%w%p]+)", "%1")
						if new_prefix ~= prefix then
							vim.fn.setcmdline(new_prefix .. suffix)
						end
					end
					fallback()
				end
			end,
		}),

		-- <c-f> move (f)orward (to the right) of each expansion locations
		-- <c-b> same as above, except moving (b)ackwards
		["<C-f>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),

		["<C-b>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),

		-- @IMPORTANT: Broken <Alt-Up>/<Alt-Down> are now working. Keep <Alt-k>/<Alt-j> alternates commented for now, until certain issue resolved.
		-- scroll up/down
		["<A-Up>"] = cmp.mapping.scroll_docs(-4),
		["<A-Down>"] = cmp.mapping.scroll_docs(4),
		-- ["<A-k>"] = cmp.mapping.scroll_docs(-4),
		-- ["<A-j>"] = cmp.mapping.scroll_docs(4),

		-- abort selection, without adding space, while remaining in Insert Mode
		["<C-e>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.abort() -- Close the completion menu without selecting any suggestion
			else
				fallback() -- Fall back to the normal <C-Space> functionality
			end
		end, { "i", "c", "s" }),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	-- default source hierarchy waterfall
	sources = {
		{ name = "nvim_lsp", group_index = 2 },
		{ name = "luasnip", group_index = 1 },
		-- { name = "dadbod" , group_index = 2},
		-- { name = "copilot", group_index = 4 },  -- @NOTE: temporarily suspendeding until fix accidental cmp issue
		{ name = "buffer", group_index = 4 },
		{ name = "path", group_index = 4 },
		{ name = "cmdline", group_index = 4 },
	},

	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			-- double underscore  methods (eg.  __repl__()) are sorted after, all other cmp choices
			-- keeps cmp options for Python clean and uncluttered
			cmp_under_comparator.under, --@TEST: Test if 'local' version works, like its 'require(<name>) works'
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
		-- priority_weight = {}	-- need to review docs first
	},

	-- cmp dap docs
	enabled = function()
		return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
	end,
})

-- Now that standard cmp configuration is set by (set by above function)
-- we can EXTEND extra configurations that will override/patch any previously
-- existing setting (or add a new setting if not defined)

--
-- @NOTE: CMP extended configurations
--

-- enable special cmp behavior for Cmdline and Search cmp for '/' and '?'
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- use cmdline & path source for ':'
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = {
		disallow_symbol_nonprefix_matching = false,
		-- @TESTME:
		disallow_fuzzy_matching = false,
		disallow_fullfuzzy_matching = false,
		disallow_partial_fuzzy_matching = false,
		disallow_partial_matching = false,
		disallow_prefix_unmatching = false,
	},
})

-- -- @HOTFIX: Fix cmdline expansion issue with special EX characters ('%') expansion for
-- -- 					commands listed in ipairs() list.
-- -- Before: :e %<tab>  >> :e %/tmp/tests/nvim_cmp_tests1.py
-- -- After: :e %<tab>  >> :e /tmp/tests/nvim_cmp_tests1.py
-- cmp.event:on("confirm_done", function(event)
-- 	if vim.api.nvim_get_mode().mode == "c" then
-- 		local line = vim.fn.getcmdline()
-- 		local col = vim.fn.getcmdpos()
-- 		local prefix = string.sub(line, 1, col - 1)
-- 		local suffix = string.sub(line, col)
--
-- 		-- Optional: only apply fix for specific commands
-- 		local should_fix = false
-- 		for _, cmd in ipairs({ "e", "edit", "vsplit", "vsp", "split", "sp", "read" }) do
-- 			if line:match("^%s*:" .. cmd .. "%s") then
-- 				should_fix = true
-- 				break
-- 			end
-- 		end
--
-- 		if not should_fix then
-- 			return
-- 		end
--
-- 		-- Strip special expansion characters if followed by expanded content
-- 		local cleaned_prefix = prefix
-- 			:gsub("%%(/[^%s]*)", "%1") -- % → full path
-- 			:gsub("#(/[^%s]*)", "%1") -- # → full path
-- 			:gsub("<[^>]+>(/[^%s]*)", "%1") -- <cfile>, <afile>, etc.
--
-- 		if cleaned_prefix ~= prefix then
-- 			vim.fn.setcmdline(cleaned_prefix .. suffix)
-- 		end
-- 	end
-- end)

-- @TODO: Review/Test sql cmp configuration with workflow
cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = "vim-dadbod-completion" },
		{ name = "buffer" },
	},
})

-- cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
-- 	sources = {
-- 		{ name = "dap" },
-- 	},
-- })
