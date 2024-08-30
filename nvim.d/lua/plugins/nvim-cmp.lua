return
{
    {
        'hrsh7th/nvim-cmp',
        lazy = false,
        priority = 100,
        event = "InsertEnter",
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        },
config = function()
    require "usercompletions" 
end
},
}


--    -- Set up nvim-cmp.
--    local cmp = require'cmp'
--
--    cmp.setup({
--        snippet = {
--          -- REQUIRED - you must specify a snippet engine
--          expand = function(args)
--            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--          end,
--        },
--        window = {
--          -- completion = cmp.config.window.bordered(),
--          -- documentation = cmp.config.window.bordered(),
--        },
--        mapping = cmp.mapping.preset.insert({
--          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--          ['<C-f>'] = cmp.mapping.scroll_docs(4),
--          ['<C-Space>'] = cmp.mapping.complete(),
--          ['<C-e>'] = cmp.mapping.abort(),
--          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--        }),
--        sources = cmp.config.sources({
--          { name = 'nvim_lsp' },
--          { name = 'luasnip' }, -- For luasnip users.
--        }, {
--          { name = 'buffer' },
--        })
--    })
--
--    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
--    -- Set configuration for specific filetype.
--    --[[ cmp.setup.filetype('gitcommit', {
--    sources = cmp.config.sources({
--      { name = 'git' },
--    }, {
--      { name = 'buffer' },
--    })
--    })
--    require("cmp_git").setup() ]]-- 
--
--    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--    cmp.setup.cmdline({ '/', '?' }, {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = {
--      { name = 'buffer' }
--    }
--    })
--
--    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--    cmp.setup.cmdline(':', {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = cmp.config.sources({
--      { name = 'path' }
--    }, {
--      { name = 'cmdline' }
--    }),
--    matching = { disallow_symbol_nonprefix_matching = false }
--    })
--
--
--
--    -- TODO: change from default selection/navigation to Supertab-esque
--    --local luasnip = require("luasnip")
--    --local cmp = require("cmp")
--    --
--    --cmp.setup({
--    --
--    --  -- ... Your other configuration ...
--    --
--    --  mapping = {
--    --
--    --    -- ... Your other mappings ...
--    --   ['<CR>'] = cmp.mapping(function(fallback)
--    --        if cmp.visible() then
--    --            if luasnip.expandable() then
--    --                luasnip.expand()
--    --            else
--    --                cmp.confirm({
--    --                    select = true,
--    --                })
--    --            end
--    --        else
--    --            fallback()
--    --        end
--    --    end),
--    --
--    --    ["<Tab>"] = cmp.mapping(function(fallback)
--    --      if cmp.visible() then
--    --        cmp.select_next_item()
--    --      elseif luasnip.locally_jumpable(1) then
--    --        luasnip.jump(1)
--    --      else
--    --        fallback()
--    --      end
--    --    end, { "i", "s" }),
--    --
--    --    ["<S-Tab>"] = cmp.mapping(function(fallback)
--    --      if cmp.visible() then
--    --        cmp.select_prev_item()
--    --      elseif luasnip.locally_jumpable(-1) then
--    --        luasnip.jump(-1)
--    --      else
--    --        fallback()
--    --      end
--    --    end, { "i", "s" }),
--    --
--    --    -- ... Your other mappings ...
--    --  },
--    --
--    --  -- ... Your other configuration ...
--    --})
--
--    -- TODO: LSP CONFIG COMPLETION FOR PYRIGHT/BASHLS/SQL/DOCKER/YAM/VIM/LUA
--
--    ---- Set up lspconfig.
--    --local capabilities = require('cmp_nvim_lsp').default_capabilities()
--    ---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--    --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--    --capabilities = capabilities
--    --}
--
--}
