return {
	"AckslD/swenv.nvim",
	opts = {
		post_set_venv = function(venv_path)
			vim.g.python3_host_prog = venv_path .. "/bin/python"
		end,
		venv_dirs = { "~/.local/state/python/uv/uvv" }, -- Adjust this based on where uv stores environments
	},
}
