return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      events = { "BufWritePost" }, --InsertLeave
      linters_by_ft = {
	-- Use the "*" filetype to run linters on all filetypes.
	-- ['*'] = { 'global linter' },
	-- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
	-- ['_'] = { 'fallback linter' },
	-- ["*"] = { "typos" },
	python = { 
	  'flake8',
	  --'ruff',
	},
	bash = {
	  'shellcheck', 
	  --'bash'
	},
	yaml = { "yamllint",
	},
	--text = {'write-good',}
	--ansible = { 'ansiblelint',},
      },
      --linters = {
      --},
    },
    config = function(_,opts)
	local M = {}
	local lint = require("lint")
	lint.linters_by_ft = opts.linters_by_ft

	function M.debounce(ms, fn)
	  local timer = vim.uv.new_timer()
	  return function(...)
	    local argv = { ... }
	    timer:start(ms, 0, function()
	      timer:stop()
	      vim.schedule_wrap(fn)(unpack(argv))
	    end)
	  end
	end

      function M.lint()
	  -- Use nvim-lint's logic first:
	  -- * checks if linters exist for the full filetype first
	  -- * otherwise will split filetype by "." and add all those linters
	  -- * this differs from conform.nvim which only uses the first filetype that has a formatter
	  local names = lint._resolve_linter_by_ft(vim.bo.filetype)
	  -- Run linters.
	  if #names > 0 then
	    lint.try_lint(names)
	  end
	end

      vim.api.nvim_create_autocmd(opts.events, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = M.debounce(100, M.lint),
    })
    end,
  },
}
