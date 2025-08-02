vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.number = true
vim.opt.relativenumber = true
vim.diagnostic.config({
  virtual_text = true,  -- shows inline error text (default: true)
  signs = true,         -- show signs in the gutter
  underline = true,     -- underline the error line
  update_in_insert = false, -- don't update diagnostics while typing
  severity_sort = true,     -- sort by severity (errors > warnings)
})

