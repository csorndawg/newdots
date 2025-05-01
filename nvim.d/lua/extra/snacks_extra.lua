-- lua/extra/snacks_extra.lua
-- sources indv. snack custom config files at plugin runtime

return {
	modules = {
		"snacks.input",
		"snacks.notifier",
		"snacks.terminal",
		"snacks.scratch",
		"snacks.picker",
	},

	input = require("extra.snacks_extra.input"),
	notifier = require("extra.snacks_extra.notifier"),
	terminal = require("extra.snacks_extra.terminal"),
	scratch = require("extra.snacks_extra.scratch"),
	picker = require("extra.snacks_extra.picker"),
}
