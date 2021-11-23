local M = {}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

M.default_opts = {
    capabilities = capabilities
}

M.server_opts = {
    ["sumneko_lua"] = function()
        return require("lua-dev").setup {
            lspconfig = M.default_opts,
        }
    end,
    ["yamlls"] = function()
       return vim.tbl_deep_extend("force", M.default_opts, {
           settings = {
               yaml = {
                   hover = true,
                   completion = true,
                   validate = true,
                   schemas = require("schemastore").json.schemas(),
               },
           },
       })
    end,
    ["jsonls"] = function()
       return vim.tbl_deep_extend("force", M.default_opts, {
           settings = {
               json = {
                   schemas = require("schemastore").json.schemas(),
               },
           },
       })
    end,
    ["efm"] = function()
        return vim.tbl_deep_extend("force", M.default_opts, {
            init_options = { documentFormatting = true },
            root_dir = vim.loop.cwd,
        })
    end
}

M.get_opts = function (sname)
    if M.server_opts[sname] ~= nil then
        return M.server_opts[sname]()
    else
        return M.default_opts
    end
end

M.init = function()
  local cmp = require('cmp')

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    documentation = {
      border = 'single',
      winhighlight = 'FloatBorder:FloatBorder,Normal:Normal',
    },
    experimental = {
      ghost_text = true,
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'buffer' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'zsh' },
      { name = 'orgmode' }
    }),
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-5),
        ["<C-f>"] = cmp.mapping.scroll_docs(5),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = function(fallback)
            if cmp.visible() then
                return cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }(fallback)
            else
                return fallback()
            end
        end,
        ["<c-n>"] = function(fallback)
            if cmp.visible() then
                return cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }(fallback)
            else
                return cmp.mapping.complete()(fallback)
            end
        end,
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    },
    formatting = {
      format = require('lspkind').cmp_format({
        with_text = true,
        menu = {
          buffer = '[buf]',
          nvim_lsp = '[LSP]',
          nvim_lua = '[VimApi]',
          path = '[path]',
          luasnip = '[snip]',
        },
      }),
    },
  })
end

M.autopairs = function ()
    require('nvim-autopairs').setup({
        disable_filetype = { 'TelescopePrompt', 'vim' },
    })
end

return M
