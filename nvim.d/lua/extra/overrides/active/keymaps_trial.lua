-- New/Experimental keymaps that need to be tested before adding to "user/keymaps"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }


-- --
-- @PASSED: Experimental plugins that passed trial/testing stage and ready for release/moved to permanent location.
-- --

-- swap 'redo' and 'replace mode' keymaps with each other
vim.keymap.set("n", "r", "<C-r>", { noremap = true }) -- @passed
vim.keymap.set("n", "<C-r>", "R", { noremap = false })
-- undo
--vim.keymap.set("n", "<leader>u", "<C-u>", { noremap = true, silent = true })

-- buffer cycling
map("n", "<leader>.", "<cmd>bn<cr>", { desc = "Buffer next", noremap = true, silent = true })
map("n", "<leader>,", "<cmd>bp<cr>", { desc = "Buffer prev", noremap = true, silent = true })

-- alt. buffer cycling
map("n", "[[", "<cmd>bn<cr>", { desc = "Buffer prev", noremap = true, silent = true })
map("n", "]]", "<cmd>bn<cr>", { desc = "Buffer next", noremap = true, silent = true })

-- @TODO: Remove previous '<leader>z' mappings/whichkey labels for all migrated keymaps
vim.keymap.set("n", "<leader>ms", ":set signcolumn=no<CR>", { silent = true, desc = "Disable sign column" })
vim.keymap.set("n", "<leader>mS", ":set signcolumn=auto<CR>", { silent = true, desc = "Enable sign column" })

-- toggle line numbers on/off
vim.keymap.set(
	"n",
	"<leader>ml",
	":set norelativenumber nonumber <Cr>",
	{ silent = true, desc = "Toggle line numbers off" }
)
vim.keymap.set("n", "<leader>mL", ":set relativenumber number <Cr>", { silent = true, desc = "Toggle line numbers on" })

-- toggle fold column on/off
vim.keymap.set("n", "<leader>mf", ":set foldcolumn=0<Cr>", { silent = true, desc = "Toggle fold column off" })
vim.keymap.set("n", "<leader>mF", ":set foldcolumn=1<Cr>", { silent = true, desc = "Toggle fold column on" })

-- paste toggling
vim.keymap.set("n", "<leader>mp", ":set paste<cr>", { desc = "Paste on" })
vim.keymap.set("n", "<leader>mP", ":set nopaste<cr>", { desc = "Paste off" })

-- save/quit/savequit
map("n", "<leader><leader>w", "<cmd>w<CR>", { noremap = true, desc = "Save" }) -- Save
map("n", "<leader>W", "<cmd>w!<CR>", { noremap = true, desc = "Save forcefully" }) -- Save forcefully
map("n", "<leader>qq", "<cmd>q<CR>", { noremap = true, desc = "Quit forcefully" }) -- Quit
map("n", "<leader><leader>q", "<cmd>q<CR>", { noremap = true, desc = "Quit" }) -- Quit
map("n", "<leader>Q", "<cmd>q!<CR>", { noremap = true, desc = "Quit forcefully" }) -- Quit forcefully
map("n", "<leader><leader>x", "<cmd>wq<CR>", { noremap = true, desc = "Save & Quit" }) -- Save and quit
-- map("n", "<leader>X", "<cmd>wq!<CR>", opts) -- Save and quit forcefully

-- quickfix navigation
map("n", "<leader>qo", "<cmd>copen <cr>", { desc = "Open quicklist", silent = false })
map("n", "<leader>qc", "<cmd>cclose <cr>", { desc = "Close quicklist", silent = false })
map("n", "<leader>qn", "<cmd>cnext <cr>", { desc = "Next quicklist", silent = false })
map("n", "<leader>qp", "<cmd>cprev <cr>", { desc = "Prev quiclist", silent = false })


-- --
-- @TESTME: Test all of the currently enabled keymaps, experimental keymaps below.
-- --


--
-- --
-- @TODO: Cleanup the experimental keymaps commented out below. Keymap is commented out because it needs to be fixed/moved/deleted/finished/tested.
-- <future keymap>. If work needed to resolve/uncomment will be longer than a few days move out of overrides/active and into overrides/trial_keymaps
-- --
