return {
  {
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    event = "InsertEnter"
  },
  {
    'L3MON4D3/LuaSnip', -- Snippets plugin
    event = "InsertEnter"
  },
  {
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    event = "InsertEnter"
  },
  {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'neovim/nvim-lspconfig',
      -- "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer"
    },
    config = function()
      local luasnip = require 'luasnip'
      local cmp = require 'cmp'
      local select_next = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' })
      local select_prev = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' })

      cmp.setup {
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ""
            -- vim_item.kind = ""
            vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
            return vim_item
          end
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
          ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
          -- C-b (back) C-f (forward) for snippet placeholder navigation.
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            select = true,
            behavior = cmp.ConfirmBehavior.Insert,
          },
          ['<C-n>'] = select_next,
          ['<C-p>'] = select_prev,
          ['<Tab>'] = select_next,
          ['<S-Tab>'] = select_prev
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'luasnip' },
        },
      }
    end
  },
  {
    "rcarriga/cmp-dap",
    event = "InsertEnter",
    config = function()
      require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        sources = {
          { name = "dap" },
        },
      })
    end
  }
}
