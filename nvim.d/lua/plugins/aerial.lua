-- Plugin specification for aerial.nvim using Lazy.nvim
return {
	"stevearc/aerial.nvim",
	event = "VeryLazy",
	-- empty "{}" prevents "setup()" from being automatically called
	-- which is what I want since this will be handled in
	-- my custom aerial config file (extra/aerial-custom.lua)
	opts = {},
}
