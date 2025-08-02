-- this file is a combined config for mason and lsp tools
-- collectively this provides the mason package manager
-- as well as autocomplete suggestions from the lsp
-- and community maintained code snippets
return {
  {
    "neovim/nvim-lspconfig", -- LSP support
    dependencies = {
      { "williamboman/mason.nvim",           config = true },
      { "williamboman/mason-lspconfig.nvim", config = true },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "lua_ls" }, -- your servers here
        handlers = {
          function(server)
            require("lspconfig")[server].setup({
              capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })
          end,
        },
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",               -- Autocompletion engine
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",         -- Connects LSP to cmp
      "hrsh7th/cmp-buffer",           -- buffer words
      "hrsh7th/cmp-path",             -- filesystem paths
      "saadparwaiz1/cmp_luasnip",     -- LuaSnip integration
      "L3MON4D3/LuaSnip",             -- Snippets engine
      "rafamadriz/friendly-snippets", -- Optional: prebuilt snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
