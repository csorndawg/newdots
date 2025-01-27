local dap = require('dap')
local dapui = require('dapui')

-- Note: All <cmd> commands need <Cr> at remap end


-- example mapping

-- Debug Step Over
vim.keymap.set(
  "n",
  "<leader>dv",
  function()
    dap.step_over()
  end,
  {noremap=true, desc = "Step Over"})

-- DAP-UI Toggle
vim.keymap.set("n","<leader>dt",
  function()
    dapui.toggle()
  end,
  {desc = "Toggle DAP-UI", noremap=true}
)

-- TODO: Setup keymaps for remaining "which-extra" debug keybindings
