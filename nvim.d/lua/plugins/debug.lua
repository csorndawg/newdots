-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
	-- NOTE: Yes, you can install new plugins here!
	"mfussenegger/nvim-dap",
	-- NOTE: And you can specify dependencies as well
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",

		-- Required dependency for nvim-dap-ui
		"nvim-neotest/nvim-nio",

		-- Installs the debug adapters for you
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		-- testers
		"mfussenegger/nvim-dap-python",
		"nvim-neotest/neotest",
		"nvim-neotest/neotest-python",
		-- @BROKEN: "nvim-neotest/neotest-bash",
	},
	keys = {
		-- Basic debugging keymaps, feel free to change to your liking!
		{
			"<Leader>dc",
			function()
				require("dap").continue()
			end,
		},
		{
			"<Leader>di",
			function()
				require("dap").step_into()
			end,
		},
		{
			"<Leader>dv",
			function()
				require("dap").step_over()
			end,
		},
		{
			"<Leader>do",
			function()
				require("dap").step_out()
			end,
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
		},
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
		},
		-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
		{
			"<Leader>dt",
			function()
				require("dapui").toggle()
			end,
			
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			-- Makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- You can provide additional configuration to the handlers,
			-- see mason-nvim-dap README for more information
			handlers = {},

			-- You'll need to check that you have the required things installed
			-- online, please don't ask me how to install them :)
			ensure_installed = {
				-- Update this to ensure that you have the debuggers for the langs you want
				"debugpy",
				"bash-debug-adapter",
			},
		})

		-- Dap UI setup
		-- For more information, see |:help nvim-dap-ui|
		dapui.setup({
			-- Set icons to characters that are more likely to work in every terminal.
			--    Feel free to remove or use ones that you like more! :)
			--    Don't feel like these are good choices.
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		-- Change breakpoint icons
		-- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
		-- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
		-- local breakpoint_icons = vim.g.have_nerd_font
		--     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
		--   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
		-- for type, icon in pairs(breakpoint_icons) do
		--   local tp = 'Dap' .. type
		--   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
		--   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
		-- end

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Install golang specific config
		--    require('dap-go').setup {
		--      delve = {
		--        -- On Windows delve must be run attached or it crashes.
		--        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
		--        detached = vim.fn.has 'win32' == 0,
		--      },
		--    }

		-- SRC: https://github.com/LunarVim/starter.lvim/blob/python-ide/config.lua
		-- setup testing
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					-- Extra arguments for nvim-dap configuration
					-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
					dap = {
						justMyCode = false,
						console = "integratedTerminal",
					},
					args = { "--log-level", "DEBUG", "--quiet" },
					runner = "pytest",
				}),
			      -- @TODO: Add configuration for bash tester
			},
		})
	end,
}
