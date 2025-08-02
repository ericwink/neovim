-- note that docs indicate branch will switch to 'main' in the future
-- run :TSUpdate occassionally to update all parsers
return {
  "nvim-treesitter/nvim-treesitter", 
  branch = 'master', 
  lazy = false, 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      }
    })
  end
}


