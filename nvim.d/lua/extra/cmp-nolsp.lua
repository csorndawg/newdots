-- NON-LSP CMP Configuration (LSP CMP has its own indvidual extra config)

-- import non-lsp cmp plugins
local cl = require("cmp_luasnip")
local lsnip = require("LuaSnip")

local cp = require("cmp-path")
local cb = require("cmp-buffer")
local cc = require("cmp-cmdline")

local cmp = require("nvim-cmp")
