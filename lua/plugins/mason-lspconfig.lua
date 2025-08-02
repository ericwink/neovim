return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
-- return {
--   "mason-org/mason-lspconfig.nvim",
--   opts = {
--     handlers = {
--       function(server_name)
--         vim.lsp.enable(server_name, {
--           on_attach = function(_, bufnr)
--             vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover Docs" })
--           end,
--         })
--       end
--     }
--   },
--   dependencies = {
--     { "mason-org/mason.nvim", opts = {} },
--   },
-- }
--
