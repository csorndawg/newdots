local cmp = require("cmp")
local luasnip = require("luasnip")

vim.o.completeopt = "menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
		-- cycle forward through cmp choices with <Tab>
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end,
		-- cycle backwards through cmp choices with <Shift-Tab>
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
		-- expand cmp choice/option with <Tab>
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
          fallback()
        end
      end,
    }),
		-- jump to next snippet tabstop with <Ctrl-f>
    ["<C-f>"] = cmp.mapping(function()
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      end
    end, { "i", "s" }),
		-- jump to previous snippet tabstop with <Ctrl-b>
    ["<C-b>"] = cmp.mapping(function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { "i", "s" }),
		-- scroll up cmp choice docs with <Alt-Up>
    ["<A-Up>"] = cmp.mapping.scroll_docs(-4),
		-- scroll down cmp choice docs with <Alt-Down>
    ["<A-Down>"] = cmp.mapping.scroll_docs(4),
		-- abort cmp (restore state back to its state prior to triggering cmp)
    ["<C-e>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.abort()
      else
        fallback()
      end
    end, { "i", "c", "s" }),
  },
  sources = cmp.config.sources({
    { name = "luasnip", group_index = 1 },
    { name = "nvim_lsp", group_index = 2 },
    { name = "buffer", group_index = 4 },
    { name = "path", group_index = 4 },
    { name = "cmdline", group_index = 4 },
  }),
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require("cmp-under-comparator").under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
      or require("cmp_dap").is_dap_buffer()
  end,
})

-- Cmdline completions
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- SQL and DAP-specific
cmp.setup.filetype("sql", {
  sources = {
    { name = "vim-dadbod-completion" },
    { name = "buffer" },
  },
})
cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
})
