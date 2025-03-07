return {
	"rcarriga/nvim-notify",
	opts = function(_, opts)
		require("extra.notify").setup()
	end,
}
